abstract class StorageRepository {
  Future<bool> containsData(String key);

  Future<T?> readValue<T>(String key);

  Future<void> setValue(String key, dynamic value);

  Future<void> deleteOnly(Set<String> only);

  Future<void> deleteAll();
}
