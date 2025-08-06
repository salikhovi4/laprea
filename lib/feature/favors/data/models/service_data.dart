import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_data.freezed.dart';
part 'service_data.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.pascal)
class ServiceData with _$ServiceData {
  const ServiceData({
    required this.serviceId,
    required this.duration,
    required this.serviceName,
    required this.servicePrice,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) =>
      _$ServiceDataFromJson(json);

  @override
  final int serviceId;
  @override
  final String serviceName;
  @override
  final int servicePrice;
  @override
  final int duration;

  String searchValue() => serviceName.toLowerCase();

  String durationStr() => '$duration мин';

  String priceStr() => '$servicePrice ₽';
}
