// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceData {

 int get serviceId; String get serviceName; int get servicePrice; int get duration;
/// Create a copy of ServiceData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDataCopyWith<ServiceData> get copyWith => _$ServiceDataCopyWithImpl<ServiceData>(this as ServiceData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceData&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.servicePrice, servicePrice) || other.servicePrice == servicePrice)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceName,servicePrice,duration);

@override
String toString() {
  return 'ServiceData(serviceId: $serviceId, serviceName: $serviceName, servicePrice: $servicePrice, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ServiceDataCopyWith<$Res>  {
  factory $ServiceDataCopyWith(ServiceData value, $Res Function(ServiceData) _then) = _$ServiceDataCopyWithImpl;
@useResult
$Res call({
 int serviceId, int duration, String serviceName, int servicePrice
});




}
/// @nodoc
class _$ServiceDataCopyWithImpl<$Res>
    implements $ServiceDataCopyWith<$Res> {
  _$ServiceDataCopyWithImpl(this._self, this._then);

  final ServiceData _self;
  final $Res Function(ServiceData) _then;

/// Create a copy of ServiceData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? duration = null,Object? serviceName = null,Object? servicePrice = null,}) {
  return _then(ServiceData(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,servicePrice: null == servicePrice ? _self.servicePrice : servicePrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
