import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender {
  @JsonValue('M')
  male,
  @JsonValue('F')
  female;

  bool get isMale => this == Gender.male;

  bool get isFemale => this == Gender.female;
}
