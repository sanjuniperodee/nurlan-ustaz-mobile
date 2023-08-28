// ignore_for_file: constant_identifier_names
const TEST = 'http://86.107.45.90:8000';

const PROD = 'https://dev.nurlanustaz.kz';

const SERVER_ = PROD;

mixin EndPoints {
  static const String onBoarding = '/api/support/onboarding/';
  static const String appVersions = '/api/support/app-version/';

  /// auth
  static const String createUser = '/api/users/';
  static const String activateUser = '/api/users/activation/';
  static const String createToken = '/api/jwt/create/';
  static const String refreshToken = '/api/jwt/refresh/';
  static const String verifyToken = '/api/jwt/verify/';

  static const String resetPassword = '/api/users/reset_password/';
  static const String resetPasswordConfirm =
      '/api/users/reset_password_confirm/';
  static const String resetConfirmCode =
      '/api/users/reset_password_confirm_code/';
  static const String resendActivation = '/api/users/resend_activation/';

  static const String register = '/api/v1/register';
  static const String registerVerify = '/api/v1/verifyUserPhone';
  static const String passwordVerify = '/api/v1/password-reset/verify';
  static const String passwordUpdate = '/api/v1/password-reset/update';

  static const String newPass = '/api/users/set_password/';
  static const String sendCode = '/api/v1/sendCode';

  //HOME
  static const String prayerTimes = '/api/islam/prayer-times/';
  static const String timings = '/api/islam/prayer-times/timings/';
  static const String geoNames = '/api/notifications/devices/geo_names/';
  static const String notification = '/api/notifications/devices/';
  static const String getNotification = '/api/notifications/notifications/';

  static const String setCity = '/api/notifications/devices/';
  static const String banner = '/api/v1/banners';
  static const String faq = '/api/support/faq/';
  static const String prjInfo = '/api/support/project-info/';
  static const String seminar = '/api/banner/seminars/';
  static const String charities = '/api/additional-services/charities/';
  static const String imamServices = '/api/additional-services/imam-services/';
  static const String lives = '/api/blog/lives/';
  static const String partners = '/api/additional-services/partners/';
  static const String news = '/api/banner/news/';
  static const String commentReport = '/api/support/reports/';
  static const String chats = '/api/tell-me-ustaz/chats/';

// TUS ZHORU
  static const String tusZhoru = '/api/dream-book/interpretations/';
  static const String customTusZhoru =
      '/api/dream-book/custom-interpretations/';

  //ISLAM TEACHING

  static const String ayatOfDay = '/api/knowledge/surahs/ayat_of_the_day/';
  static const String pillars = '/api/islam/pillars/';
  static const String ablutions = '/api/islam/ablutions/';
  static const String fatwas = '/api/knowledge/fatwas/';
  static const String namesOfAllah = '/api/knowledge/names_of_allah/';
  static const String surahs = '/api/knowledge/surahs/';
  static const String duha = '/api/knowledge/duas/';
  static const String dhikrs = '/api/knowledge/dhikrs/';
  static const String muslimNames = '/api/knowledge/muslim_names/';

  //ZHOSPARYM
  static const String events = '/api/calendar/events/';
  static const String checklist = '/api/calendar/checklists/';
  static const String checklistDays = '/api/calendar/checklist-days/';
}
