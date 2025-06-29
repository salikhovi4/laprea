import 'package:service/storage/domain/repository/storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepositoryImpl implements StorageRepository {
  SharedPreferences? sharedPreferences;

  @override
  Future<bool> containsData(String key) async {
    await _ensureInitialized();
    final shared = sharedPreferences;
    if (shared != null) {
      return shared.containsKey(key);
    } else {
      return false;
    }
  }

  @override
  Future<void> deleteAll() async {
    await _ensureInitialized();
    final keys = sharedPreferences?.getKeys();
    keys?.forEach((element) async {
      await sharedPreferences?.remove(element);
    });
  }

  @override
  Future<void> deleteOnly(Set<String> only) async {
    await _ensureInitialized();
    only.forEach((element) async {
      await sharedPreferences?.remove(element);
    });
  }

  @override
  Future<T?> readValue<T>(String key) async {
    await _ensureInitialized();
    return sharedPreferences?.get(key) as T?;
  }

  @override
  Future<void> setValue(String key, dynamic value) async {
    await _ensureInitialized();
    if (value is bool) {
      await sharedPreferences?.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences?.setDouble(key, value);
    } else if (value is int) {
      await sharedPreferences?.setInt(key, value);
    } else if (value is String) {
      await sharedPreferences?.setString(key, value);
    } else if (value is List<String>) {
      await sharedPreferences?.setStringList(key, value);
    } else {
      throw UnsupportedError("Not supported type for shared preferences");
    }
  }

  Future<void> _ensureInitialized() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }
}
