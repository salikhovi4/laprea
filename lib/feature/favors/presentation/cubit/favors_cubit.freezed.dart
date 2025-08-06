// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favors_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavorsState {

 FavorsStatus get favorsStatus; ClientException? get exception; List<FavorData> get favors; List<ServiceData> get searched;
/// Create a copy of FavorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavorsStateCopyWith<FavorsState> get copyWith => _$FavorsStateCopyWithImpl<FavorsState>(this as FavorsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavorsState&&(identical(other.favorsStatus, favorsStatus) || other.favorsStatus == favorsStatus)&&(identical(other.exception, exception) || other.exception == exception)&&const DeepCollectionEquality().equals(other.favors, favors)&&const DeepCollectionEquality().equals(other.searched, searched));
}


@override
int get hashCode => Object.hash(runtimeType,favorsStatus,exception,const DeepCollectionEquality().hash(favors),const DeepCollectionEquality().hash(searched));

@override
String toString() {
  return 'FavorsState(favorsStatus: $favorsStatus, exception: $exception, favors: $favors, searched: $searched)';
}


}

/// @nodoc
abstract mixin class $FavorsStateCopyWith<$Res>  {
  factory $FavorsStateCopyWith(FavorsState value, $Res Function(FavorsState) _then) = _$FavorsStateCopyWithImpl;
@useResult
$Res call({
 FavorsStatus favorsStatus, ClientException? exception, List<FavorData> favors, List<ServiceData> searched
});




}
/// @nodoc
class _$FavorsStateCopyWithImpl<$Res>
    implements $FavorsStateCopyWith<$Res> {
  _$FavorsStateCopyWithImpl(this._self, this._then);

  final FavorsState _self;
  final $Res Function(FavorsState) _then;

/// Create a copy of FavorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favorsStatus = null,Object? exception = freezed,Object? favors = null,Object? searched = null,}) {
  return _then(FavorsState(
favorsStatus: null == favorsStatus ? _self.favorsStatus : favorsStatus // ignore: cast_nullable_to_non_nullable
as FavorsStatus,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as ClientException?,favors: null == favors ? _self.favors : favors // ignore: cast_nullable_to_non_nullable
as List<FavorData>,searched: null == searched ? _self.searched : searched // ignore: cast_nullable_to_non_nullable
as List<ServiceData>,
  ));
}

}


// dart format on
