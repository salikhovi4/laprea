import 'package:service/device_info/domain/entity/device_uuid.dart';
import 'package:service/service_flutter.dart';

abstract class DeviceInfoLocalDataSource {
  Future<DeviceUuid?> getDeviceUuid();

  Future<void> saveDeviceUuid(DeviceUuid uuid);
}

const _deviceUidKey = "DeviceUidKey";

final class DeviceInfoLocalDataSourceImpl implements DeviceInfoLocalDataSource {
  final StorageInteractor persistentStorageInteractor;

  DeviceInfoLocalDataSourceImpl({required this.persistentStorageInteractor});

  @override
  Future<DeviceUuid?> getDeviceUuid() async{
    final savedUuid = (await persistentStorageInteractor.readValue(_deviceUidKey)) as String?;
    if(savedUuid == null){
      return null;
    } else {
      return DeviceUuid(uuid: savedUuid);
    }
  }

  @override
  Future<void> saveDeviceUuid(DeviceUuid uuid) =>
      persistentStorageInteractor.setValue(_deviceUidKey, uuid.uuid);
}
