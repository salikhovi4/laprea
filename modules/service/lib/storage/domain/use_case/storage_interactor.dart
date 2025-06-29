import 'package:service/storage/domain/repository/storage_repository.dart';

class StorageInteractor {
  final StorageRepository repository;

  StorageInteractor(this.repository);

  Future<bool> containsData(String key) => repository.containsData(key);

  Future<T?> readValue<T>(String key) => repository.readValue<T>(key);

  Future<void> setValue(String key, dynamic value) => repository.setValue(key, value);

  Future<void> removeValue(String key) => repository.deleteOnly({key});

  Future<void> deleteAll() => repository.deleteAll();
}
