mixin EndPoints {
  static const testHost = '86.107.45.90';
  static const test2Host = 'dev.nurlanustaz.kz';
  static const prodHost = 'api.nurlanimam.kz';

  // Active host — currently pointing to production
  static const activeHost = 'api.nurlanimam.kz';
  static const apiUrl = 'https://$activeHost/api';
  static const wsUrl = 'wss://$activeHost/api';
  // To switch to a different host, change activeHost above.
  // static const apiUrl = 'https://$prodHost/api';
  // static const wsUrl = 'wss://$prodHost/api';

  static String imgUrlBuilder(String path) => 'https://$activeHost$path';

  static const String onBoarding = '/support/onboarding/';
  static const String appVersions = '/support/app-version/';

  // ws
  static const String wsSupportChat = "$wsUrl/support/chat/";
  static const String wsTellMeUstazChat = "$wsUrl/tell-me-ustaz/chat/";

  /// auth
  static const String createUser = '/users/';
  static const String currentUser = '/users/me/';
  static const String activateUser = '/users/activation/';
  static const String createToken = '/jwt/create/';
  static const String refreshToken = '/jwt/refresh/';
  static const String blacklistToken = '/jwt/blacklist/';
  static const String verifyToken = '/jwt/verify/';

  static const String resetPassword = '/users/reset_password/';
  static const String resetPasswordConfirm = '/users/reset_password_confirm/';
  static const String resetConfirmCode = '/users/reset_password_confirm_code/';
  static const String resendActivation = '/users/resend_activation/';

  static const String newPass = '/users/set_password/';

  //HOME
  static const String prayerTimes = '/islam/prayer-times/';
  static const String timings = '/islam/prayer-times/timings/';
  static const String geoNames = '/notifications/devices/geo_names/';
  static const String notification = '/notifications/devices/';
  static const String getNotification = '/notifications/notifications/';

  static const String setCity = '/notifications/devices/';
  static const String faq = '/support/faq/';
  static const String prjInfo = '/support/project-info/';
  static const String seminar = '/banner/seminars/';
  static const String charities = '/additional-services/charities/';
  static const String imamServices = '/additional-services/imam-services/';
  static const String lives = '/blog/lives/';
  static const String partners = '/additional-services/partners/';
  static const String news = '/banner/news/';
  static const String commentReport = '/support/reports/';
  static const String chats = '/tell-me-ustaz/chats/';

// TUS ZHORU
  static const String tusZhoru = '/dream-book/interpretations/';
  static const String customTusZhoru = '/dream-book/custom-interpretations/';

  //ISLAM TEACHING

  static const String ayatOfDay = '/knowledge/surahs/ayat_of_the_day/';
  static const String pillars = '/islam/pillars/';
  static const String ablutions = '/islam/ablutions/';
  static const String fatwas = '/knowledge/fatwas/';
  static const String namesOfAllah = '/knowledge/names_of_allah/';
  static const String surahs = '/knowledge/surahs/';
  static const String duha = '/knowledge/duas/';
  static const String dhikrs = '/knowledge/dhikrs/';
  static const String muslimNames = '/knowledge/muslim_names/';

  //ZHOSPARYM
  static const String events = '/calendar/events/';
  static const String checklist = '/calendar/checklists/';
  static const String checklistDays = '/calendar/checklist-days/';
  //cards
  static const String cards = '/payment/cards/';
  static const String addCard = '/payment/cards/add/';
  /// DELETE cards/<id>/remove/ — delete card by DB id (token stays server-side).
  static String cardRemove(int cardId) => '$cards$cardId/remove/';
}
