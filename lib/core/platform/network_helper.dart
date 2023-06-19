// ignore_for_file: constant_identifier_names

const SERVER_ = 'http://86.107.45.90:8000';
const SERVER_IP = '86.107.199.205';
const SERVER_PATH = '/api/v1';

mixin EndPoints {
  /// auth
  static const String createUser = '/api/users/';
  static const String activateUser = '/api/users/activation/';
  static const String createToken = '/api/jwt/create/';
  static const String refreshToken = '/api/jwt/refresh/';

  static const String register = '/api/v1/register';
  static const String registerVerify = '/api/v1/verifyUserPhone';
  static const String resetPassword = '/api/v1/reset-password';
  static const String passwordVerify = '/api/v1/password-reset/verify';
  static const String passwordUpdate = '/api/v1/password-reset/update';
  static const String newPass = '/api/users/set_password/';
  static const String sendCode = '/api/v1/sendCode';

  static const String logout = '/api/v1/logout';
  static const String deleteUser = '/api/v1/deleteUser';
  static const String changeNumber = '/api/v1/changeNumberSend';
  static const String changeNumberPost = '/api/v1/changeNumberPost';

  //HOME
  static const String banner = '/api/v1/banners';
  static const String faq = '/api/support/faq/';
  static const String prjInfo = '/api/support/project-info/';
  static const String seminar = '/api/banner/seminars/';
  static const String charities = '/api/additional-services/charities/';
  static const String imamServices = '/api/additional-services/imam-services/';
  static const String lives = '/api/blog/lives/';
  static const String partners = '/api/additional-services/partners/';
  static const String news = '/api/banner/news/';

  //ISLAM TEACHING

  static const String ayatOfDay = '/api/knowledge/surahs/ayat_of_the_day/';
  static const String pillars = '/api/islam/pillars/';
  static const String fatwas = '/api/knowledge/fatwas/';
  static const String namesOfAllah = '/api/knowledge/names_of_allah/';
  static const String surahs = '/api/knowledge/surahs/';
  static const String duha = '/api/knowledge/duas/';
  static const String dhikrs = '/api/knowledge/dhikrs/';
  static const String muslimNames = '/api/knowledge/muslim_names/';
}
