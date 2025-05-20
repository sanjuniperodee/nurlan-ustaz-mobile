import 'package:easy_localization/easy_localization.dart';

typedef TextValidation = (bool Function(String? text), String);

final class ValidatorManager extends Object {
  ValidatorManager({required this.validations})
      : assert(validations.isNotEmpty);

  ValidatorManager.notEmpty([List<TextValidation>? additionalValidations])
      : validations = [
          notEmptyValidation,
          ...?additionalValidations,
        ];

  ValidatorManager.password([List<TextValidation>? additionalValidations])
      : validations = [
          notEmptyValidation,
          passwordValidation,
          ...?additionalValidations,
        ];

  ValidatorManager.email([List<TextValidation>? additionalValidations])
      : validations = [
          notEmptyValidation,
          emailValidation,
          ...?additionalValidations,
        ];

  ValidatorManager.twelveSymbolsPhone(
      [List<TextValidation>? additionalValidations])
      : validations = [
          notEmptyValidation,
          twelveSymbolsPhoneValidation,
          ...?additionalValidations,
        ];

  final List<TextValidation> validations;

  String? call(String? text) {
    for (final validation in validations) {
      if (validation.$1(text)) continue;
      return validation.$2;
    }
    return null;
  }

  static TextValidation notEmptyValidation = (
    (String? text) => text?.isNotEmpty ?? false,
    'the_field_cannot_be_empty'.tr(),
  );

  static TextValidation emailValidation = (
    (String? text) => RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text ?? ''),
    'write_correct_email'.tr(),
  );

  static TextValidation passwordValidation = (
    (String? text) => (text?.length ?? 0) >= 8,
    'Пароль должен содержать минимум 8 символов',
  );

  static TextValidation twelveSymbolsPhoneValidation = (
    (String? text) => (text?.length ?? 0) == 12,
    'Введите номер телефона',
  );
}

String? notEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'the_field_cannot_be_empty'.tr();
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_name'.tr();
  }
  return null;
}

String? surnameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_lastname'.tr();
  }
  return null;
}

String? phoneOrEmailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'valid_enter_your_phone_number_or_email'.tr();
  }
  return null;
}

bool isValidEmail(String value) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);
}

String? phoneOrValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'valid_enter_your_phone_number'.tr();
  }
  return null;
}

String? verificationCodeValidator(String? value) {
  if (value == null) {
    return 'enter_verification_code'.tr();
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    // if (value != repeat.text) {
    //   return 'repeat error';
    // }
    return 'enter_the_password'.tr();
  } else if (value.length < 6) {
    return 'password_must_be_at_least_6_characters'.tr();
  }
  return null;
}

String? passwordRepeatValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_the_password'.tr();
  }
  return null;
}

String? sortValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_the_grade'.tr();
  }
  return null;
}

String? priceValidator(String? value) {
  if (value == "0" || value == null || value.isEmpty) {
    return 'enter_the_price'.tr();
  }
  return null;
}

String? quantityValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Введите количество';
  }
  return null;
}

//
//Orders
//

String? fulnameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_fulname'.tr();
  }
  return null;
}

String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_address'.tr();
  }
  return null;
}

String? friendAddressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_friendAddress'.tr();
  }
  return null;
}

String? comentValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'enter_your_coment'.tr();
  }
  return null;
}
