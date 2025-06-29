import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_device_info.g.dart';

@JsonSerializable()
class DeviceInfoCommon extends Equatable {
  final String? serialNumber;
  final String? deviceModel;
  final String? imei;
  final String? deviceId;
  final String? deviceType;
  final String? brand;
  final String? manufacturer;

  const DeviceInfoCommon({
    this.serialNumber,
    this.deviceModel,
    this.imei,
    this.deviceId,
    this.deviceType,
    this.brand,
    this.manufacturer,
  });

  factory DeviceInfoCommon.unknown() => const DeviceInfoCommon(deviceType: 'Unknown');

  factory DeviceInfoCommon.fromJson(Map<String, dynamic> json) => _$DeviceInfoCommonFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceInfoCommonToJson(this);

  @override
  List<Object?> get props => [serialNumber, deviceModel, imei, deviceId, deviceType];
}
