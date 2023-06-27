// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_dto.freezed.dart';
part 'statistics_dto.g.dart';

@freezed
class StatisticsDTO with _$StatisticsDTO {
  const factory StatisticsDTO({
    required int id,
    String? title,
    String? value,
  }) = _StatisticsDTO;

  factory StatisticsDTO.fromJson(Map<String, dynamic> json) =>
      _$StatisticsDTOFromJson(json);
}
