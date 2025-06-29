/// Политика кеширования данных счетов и карт
/// [cacheOnly] - данные берутся только из кеша (БД)
///
/// [networkOnly] - данные берутся только из АПИ - запрос на бекенд
///
/// [cacheWhenNetworkFailed] - данные берутся из АПИ и если приходит ошибка,
/// то возвращаем из кеша (БД) сохраненные данные
///
/// [networkWhenCacheIsNotValid] - данные в первую очередь берутся из кеша. Если данные кеша невалидны,
/// то выполняется запрос в сеть и новые данные сохраняются в кеш
enum CachePolicy {
  networkOnly,
  cacheOnly,
  cacheWhenNetworkFailed,
  networkWhenCacheIsNotValid,
}

/// Orchestrator, который отвечает за выбор способа получения данных, их сохранения в БД и возврата данных потребителю
///
/// [getData] - метод получение данных в зависимости от выбранной политики
abstract class CachePolicyOrchestrator {
  /// [checkLocal] - колбек используется только для политики [CachePolicy.networkWhenCacheIsNotValid] и используется
  /// для проверки валидности кеша, полученного с помощью [getFromLocal]: true - кеш валиден, false - невалиден
  Future<T?> getData<T>({
    required CachePolicy cachePolicy,
    required Future<T?> Function() getFromLocal,
    required Future<T> Function() getFromRemote,
    required Future<void> Function(T? data) saveData,
    Future<bool> Function(T? datta)? checkLocal,
  });
}

/// Имплементация [CachePolicyOrchestrator]
class CachePolicyOrchestratorImpl implements CachePolicyOrchestrator {
  @override
  Future<T?> getData<T>({
    required CachePolicy cachePolicy,
    required Future<T?> Function() getFromLocal,
    required Future<T> Function() getFromRemote,
    required Future<void> Function(T? data) saveData,
    Future<bool> Function(T? datta)? checkLocal,
  }) async {
    assert(
      cachePolicy != CachePolicy.networkWhenCacheIsNotValid ||
          cachePolicy == CachePolicy.networkWhenCacheIsNotValid && checkLocal != null,
      'При использовании CachePolicy.networkWhenCacheEmpty обязательно должен быть определен параметр checkLocal',
    );
    switch (cachePolicy) {
      case CachePolicy.cacheOnly:

        /// Берём данные только из БД
        return await getFromLocal();
      case CachePolicy.networkOnly:

        /// Берем данные только  из АПИ
        return await _getFromRemoteAndSaveToLocal(getFromLocal, getFromRemote, saveData);
      case CachePolicy.cacheWhenNetworkFailed:

        /// срабатает условие [cachePolicy == CachePolicy.cacheWhenNetworkFailed]
        try {
          // Пытаемся получить данные с бэка, записать в кэш, а потом вернуть оттуда
          return await _getFromRemoteAndSaveToLocal(getFromLocal, getFromRemote, saveData);
        } catch (e) {
          try {
            // Если при получении данных с бэка возникла ошибка, пробуем взять данные из кэша
            return await getFromLocal();
          } catch (_) {
            // Если взять данные из кэша не удалось, пробрасываем ошибку с бэка
            throw e;
          }
        }
      case CachePolicy.networkWhenCacheIsNotValid:
        // В первую очередь пытаемся взять данные из кеша
        final local = await getFromLocal();

        if ((await checkLocal?.call(local)) ?? true) {
          return local;
        } else {
          // Если получить данные локально не удалось, пытаемся получить данные с бека и обновить кеш
          return await _getFromRemoteAndSaveToLocal(getFromLocal, getFromRemote, saveData);
        }
    }
  }

  /// метод получения данных из АПИ, сохранения в БД и возврата данных  из БД после сохранения
  Future<T> _getFromRemoteAndSaveToLocal<T>(
    Future<T> Function() getFromLocal,
    Future<T> Function() getFromRemote,
    Future<void> Function(T data) saveData,
  ) async {
    // получаем список из remoteDataSource
    final data = await getFromRemote();
    // сохраняем список в БД
    await saveData(data);
    // получаем из БД список и возвращаем его из метода
    return await getFromLocal();
  }
}
