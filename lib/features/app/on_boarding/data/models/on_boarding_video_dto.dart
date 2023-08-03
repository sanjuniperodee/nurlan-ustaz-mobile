// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_video_dto.freezed.dart';
part 'on_boarding_video_dto.g.dart';

@freezed
class OnBoardingVideoDTO with _$OnBoardingVideoDTO {
  const factory OnBoardingVideoDTO({
    required int id,
    required int number,
    @JsonKey(name: "is_active") bool? isActive,
    required String file,
  }) = _OnBoardingVideoDTO;

  factory OnBoardingVideoDTO.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingVideoDTOFromJson(json);
}
