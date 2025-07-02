// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentState {

 SpecialistData? get selectedSpecialist; FavorData? get selectedFavor;
/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentStateCopyWith<AppointmentState> get copyWith => _$AppointmentStateCopyWithImpl<AppointmentState>(this as AppointmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentState&&(identical(other.selectedSpecialist, selectedSpecialist) || other.selectedSpecialist == selectedSpecialist)&&(identical(other.selectedFavor, selectedFavor) || other.selectedFavor == selectedFavor));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSpecialist,selectedFavor);

@override
String toString() {
  return 'AppointmentState(selectedSpecialist: $selectedSpecialist, selectedFavor: $selectedFavor)';
}


}

/// @nodoc
abstract mixin class $AppointmentStateCopyWith<$Res>  {
  factory $AppointmentStateCopyWith(AppointmentState value, $Res Function(AppointmentState) _then) = _$AppointmentStateCopyWithImpl;
@useResult
$Res call({
 FavorData? selectedFavor, SpecialistData? selectedSpecialist
});




}
/// @nodoc
class _$AppointmentStateCopyWithImpl<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  _$AppointmentStateCopyWithImpl(this._self, this._then);

  final AppointmentState _self;
  final $Res Function(AppointmentState) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFavor = freezed,Object? selectedSpecialist = freezed,}) {
  return _then(AppointmentState(
selectedFavor: freezed == selectedFavor ? _self.selectedFavor : selectedFavor // ignore: cast_nullable_to_non_nullable
as FavorData?,selectedSpecialist: freezed == selectedSpecialist ? _self.selectedSpecialist : selectedSpecialist // ignore: cast_nullable_to_non_nullable
as SpecialistData?,
  ));
}

}


// dart format on
