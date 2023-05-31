// ignore_for_file: constant_identifier_names

const SERVER_ = 'http://86.107.45.90:8000';
const SERVER_IP = '86.107.199.205';
const SERVER_PATH = '/api/v1';

mixin EndPoints {
  /// auth
  static const String login = '/api/v1/auth';
  static const String register = '/api/v1/register';
  static const String registerVerify = '/api/v1/verifyUserPhone';
  static const String resetPassword = '/api/v1/reset-password';
  static const String passwordVerify = '/api/v1/password-reset/verify';
  static const String passwordUpdate = '/api/v1/password-reset/update';
  static const String refreshToken = '/api/v1/refreshToken';
  static const String sendCode = '/api/v1/sendCode';

  static const String logout = '/api/v1/logout';
  static const String deleteUser = '/api/v1/deleteUser';
  static const String changeNumber = '/api/v1/changeNumberSend';
  static const String changeNumberPost = '/api/v1/changeNumberPost';

  //HOME
  static const String banner = '/api/v1/banners';

  //ISLAM TEACHING

  static const String ayatOfDay = '/api/knowledge/surahs/ayat_of_the_day/';
  static const String pillars = '/api/islam/pillars/';
}
