// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavorData {

 int get categoryId; String get categoryName; List<ServiceData> get services;
/// Create a copy of FavorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavorDataCopyWith<FavorData> get copyWith => _$FavorDataCopyWithImpl<FavorData>(this as FavorData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavorData&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&const DeepCollectionEquality().equals(other.services, services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'FavorData(categoryId: $categoryId, categoryName: $categoryName, services: $services)';
}


}

/// @nodoc
abstract mixin class $FavorDataCopyWith<$Res>  {
  factory $FavorDataCopyWith(FavorData value, $Res Function(FavorData) _then) = _$FavorDataCopyWithImpl;
@useResult
$Res call({
 int categoryId, String categoryName, List<ServiceData> services
});




}
/// @nodoc
class _$FavorDataCopyWithImpl<$Res>
    implements $FavorDataCopyWith<$Res> {
  _$FavorDataCopyWithImpl(this._self, this._then);

  final FavorData _self;
  final $Res Function(FavorData) _then;

/// Create a copy of FavorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? services = null,}) {
  return _then(FavorData(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceData>,
  ));
}

}


// dart format on
