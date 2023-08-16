import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_model.freezed.dart';
part 'app_version_model.g.dart';


@freezed
class AppVersionsModel with _$AppVersionsModel {
  const factory AppVersionsModel({
    @JsonKey(name: "device_type") String? deviceType,
    @JsonKey(name: "version") String? version ,
  }) = _AppVersionsModel;

  factory AppVersionsModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionsModelFromJson(json);
}
