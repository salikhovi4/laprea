import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laprea/feature/favors/data/models/service_data.dart';

part 'favor_data.freezed.dart';

part 'favor_data.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.pascal)
class FavorData with _$FavorData {
  const FavorData({
    required this.categoryId,
    required this.categoryName,
    required this.services,
  });

  factory FavorData.fromJson(Map<String, dynamic> json) =>
      _$FavorDataFromJson(json);

  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final List<ServiceData> services;
}
