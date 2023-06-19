import 'package:easy_localization/easy_localization.dart';

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
