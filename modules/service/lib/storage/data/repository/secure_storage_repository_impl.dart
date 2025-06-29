import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:service/storage/domain/repository/storage_repository.dart';

const trueValue = "true";
const falseValue = "false";

class SecureStorageRepositoryImpl implements StorageRepository {
  final FlutterSecureStorage _storage;

  SecureStorageRepositoryImpl() : _storage = const FlutterSecureStorage();

  @override
  Future<bool> containsData(String key) async {
    final value = await _storage.read(
      key: key,
      iOptions: _getIOSOptions(),
    );
    return value != null;
  }

  @override
  Future<void> deleteExcluded(Set<String> excluded) async {
    final k = await _storage.readAll(
      iOptions: _getIOSOptions(),
    );
    for (final element in k.keys) {
      if (!excluded.contains(element)) {
        await _storage.delete(
          key: element,
          iOptions: _getIOSOptions(),
        );
      }
    }
  }

  @override
  Future<void> deleteOnly(Set<String> only) async {
    for (final k in only) {
      await _storage.delete(
        key: k,
        iOptions: _getIOSOptions(),
      );
    }
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll(
      iOptions: _getIOSOptions(),
    );
  }

  @override
  Future<T?> readValue<T>(key) async {
    final value = await _storage.read(
      key: key,
      iOptions: _getIOSOptions(),
    );
    return value as T?;
  }

  @override
  Future<void> setValue(String key, dynamic incomeValue) async {
    dynamic value;
    if (incomeValue is bool) {
      if (incomeValue) {
        value = trueValue;
      } else {
        value = falseValue;
      }
    } else {
      value = incomeValue;
    }
    await _storage.write(
      key: key,
      value: value.toString(),
      iOptions: _getIOSOptions(),
    );
  }

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.unlocked_this_device);

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
}
