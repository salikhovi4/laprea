import 'package:service/device_info/domain/entity/common_device_info.dart';
import 'package:service/device_info/domain/entity/device_uuid.dart';

abstract class DeviceInfoRepository {
  Future<DeviceInfoCommon> getDeviceInfo();
  Future<DeviceUuid?> getDeviceUuid();
  DeviceUuid generateDeviceUuid();
  Future<void> saveDeviceUuid(DeviceUuid uuid);
}
