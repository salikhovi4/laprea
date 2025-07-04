// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_date_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectDateState {

 List<DateTime> get availableDate; List<DateTime> get availableTime; DateTime? get selectedTime;
/// Create a copy of SelectDateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectDateStateCopyWith<SelectDateState> get copyWith => _$SelectDateStateCopyWithImpl<SelectDateState>(this as SelectDateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectDateState&&const DeepCollectionEquality().equals(other.availableDate, availableDate)&&const DeepCollectionEquality().equals(other.availableTime, availableTime)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableDate),const DeepCollectionEquality().hash(availableTime),selectedTime);

@override
String toString() {
  return 'SelectDateState(availableDate: $availableDate, availableTime: $availableTime, selectedTime: $selectedTime)';
}


}

/// @nodoc
abstract mixin class $SelectDateStateCopyWith<$Res>  {
  factory $SelectDateStateCopyWith(SelectDateState value, $Res Function(SelectDateState) _then) = _$SelectDateStateCopyWithImpl;
@useResult
$Res call({
 List<DateTime> availableDate, List<DateTime> availableTime, DateTime? selectedTime
});




}
/// @nodoc
class _$SelectDateStateCopyWithImpl<$Res>
    implements $SelectDateStateCopyWith<$Res> {
  _$SelectDateStateCopyWithImpl(this._self, this._then);

  final SelectDateState _self;
  final $Res Function(SelectDateState) _then;

/// Create a copy of SelectDateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableDate = null,Object? availableTime = null,Object? selectedTime = freezed,}) {
  return _then(SelectDateState(
availableDate: null == availableDate ? _self.availableDate : availableDate // ignore: cast_nullable_to_non_nullable
as List<DateTime>,availableTime: null == availableTime ? _self.availableTime : availableTime // ignore: cast_nullable_to_non_nullable
as List<DateTime>,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


// dart format on
