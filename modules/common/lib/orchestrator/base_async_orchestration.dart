import 'dart:async';
import 'dart:collection';

/// Выбор типа поведения оркестратора
/// [awaitExecute] - с проверкой на наличие выполнения процесса
/// [proceedAll] - выполнение процесса без задержки
enum AsyncOrchestratorBehavior { awaitExecute, proceedAll }

/// Оркестратор, который может либо предотвратить повторное выполнение процесса либо выполнить его без задержки
/// либо поставить все запросы в очередь и выполнять последовательно
abstract class AsyncOrchestrator {
  Future<T> execute<T>(Future<T> Function() code, String key, {behavior = AsyncOrchestratorBehavior.awaitExecute});
}

class QueueAsyncOrchestrator implements AsyncOrchestrator {
  final Map<String, Queue<QueueAsyncOrchestratorEntry>> map = {};

  @override
  Future<T> execute<T>(Future<T> Function() code, String key, {behavior = AsyncOrchestratorBehavior.awaitExecute}) {
    return _addEntryAndProceed(key, code).future;
  }

  Completer<T> _addEntryAndProceed<T>(String key, Future<T> Function() code) {
    bool needExecute = false;
    final completer = Completer<T>();
    final entry = QueueAsyncOrchestratorEntry(code: code, completer: completer);
    final queue = map[key];

    if (queue != null) {
      if (queue.isEmpty) {
        needExecute = true;
      }
      queue.add(entry);
    } else {
      needExecute = true;
      _createQueue(key, entry);
    }

    if (needExecute) {
      _executeInternal(key);
    }

    return entry.completer;
  }

  void _createQueue(String key, QueueAsyncOrchestratorEntry entry) {
    final created = Queue<QueueAsyncOrchestratorEntry>();
    created.add(entry);
    map[key] = created;
  }

  Future<void> _executeInternal(String key) async {
    final queue = map[key];
    if (queue != null) {
      while (queue.isNotEmpty) {
        final entry = queue.removeFirst();
        try {
          final result = await entry.code();
          entry.completer.complete(result);
        } catch (error) {
          entry.completer.completeError(error);
        }
      }
    }
  }
}

class QueueAsyncOrchestratorEntry<T> {
  final Future<T> Function() code;
  final Completer<T> completer;

  QueueAsyncOrchestratorEntry({required this.code, required this.completer});
}

class BaseAsyncOrchestrator implements AsyncOrchestrator {
  /// Маппер списков комплитеров
  final Map<String, List<Completer>> lockMap = {};

  @override
  Future<T> execute<T>(Future<T> Function() code, String key, {behavior = AsyncOrchestratorBehavior.awaitExecute}) {
    switch (behavior) {
      case AsyncOrchestratorBehavior.awaitExecute:
        return _awaitExecute(code, key);

      case AsyncOrchestratorBehavior.proceedAll:
        return _proceedAll(code, key);

      default:
        return _awaitExecute(code, key);
    }
  }

  /// Метод, в котором идёт проверка наличия в маппере [lockMap] записи с ключом [key] для исключения повторного
  /// ВЫПОЛНЕНИЯ функционала в функции [code].
  Future<T> _awaitExecute<T>(Future<T> Function() code, String key) async {
    final completer = Completer<T>();

    /* Если в маппере [lockMap] есть запись с ключом [key] то добавляем текущий completer в список и возвращаем
    future. Когда завершится выполнение уже запущенной сессии [code] произойдет завершение и текущего комплитера */
    if (lockMap.containsKey(key)) {
      lockMap[key]?.add(completer);
      return completer.future;
    }

    // Добавляем в список текущий комплитер
    lockMap.putIfAbsent(key, () => [completer]);

    // выполняем код
    code().then((value) {
      final completerList = lockMap[key] ?? [];
      for (var i = 0; i < completerList.length; i++) {
        // завершаем все комплитеры в списке по ключу [key]
        completerList[i].complete(value);
      }
      // удаляем запись из маппера
      lockMap.remove(key);
    }).catchError((e) {
      final completerList = lockMap[key] ?? [];
      for (var i = 0; i < completerList.length; i++) {
        // завершаем все комплитеры в списке по ключу [key]
        completerList[i].completeError(e);
      }
      // удаляем запись из маппера
      lockMap.remove(key);
    });

    return completer.future;
  }

  /// Возвращаем выполнение [code]
  Future<T> _proceedAll<T>(Future<T> Function() code, String key) => code();
}
