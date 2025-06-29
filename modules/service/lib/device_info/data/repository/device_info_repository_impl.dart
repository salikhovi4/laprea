import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:service/device_info/data/data_source/local_data_source.dart';
import 'package:service/device_info/domain/entity/common_device_info.dart';
import 'package:service/device_info/domain/entity/device_uuid.dart';
import 'package:service/device_info/domain/repository/device_info_repository.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoPlugin plugin;
  final DeviceInfoLocalDataSource localDataSource;

  DeviceInfoRepositoryImpl({
    required this.plugin,
    required this.localDataSource,
  });

  @override
  Future<DeviceInfoCommon> getDeviceInfo() async {
    DeviceInfoCommon? deviceInfoCommon;

    try {
      if (Platform.isAndroid) {
        final info = await plugin.androidInfo;
        deviceInfoCommon = DeviceInfoCommon(
          deviceId: info.id,
          deviceModel: info.model,
          brand: info.brand,
          manufacturer: info.manufacturer,
        );
      } else if (Platform.isIOS) {
        final info = await plugin.iosInfo;
        deviceInfoCommon = DeviceInfoCommon(
          deviceId: info.identifierForVendor,
          deviceModel: info.model,
        );
      }
    } on PlatformException {
      deviceInfoCommon = DeviceInfoCommon.unknown();
    }

    return deviceInfoCommon ?? DeviceInfoCommon.unknown();
  }

  @override
  DeviceUuid generateDeviceUuid() {
    final uuid = const Uuid().v4();
    return DeviceUuid(uuid: uuid);
  }

  @override
  Future<DeviceUuid?> getDeviceUuid() => localDataSource.getDeviceUuid();

  @override
  Future<void> saveDeviceUuid(DeviceUuid uuid) => localDataSource.saveDeviceUuid(uuid);
}
