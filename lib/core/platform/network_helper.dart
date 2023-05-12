// ignore_for_file: constant_identifier_names

const SERVER_ = 'http://86.107.199.205';
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
  static const String brends = '/api/v1/brands';
  static const String newCollection =
      '/api/v1/sc/products/groupCategoryProductsCollection';
  static const String newCategories = '/api/v1/sc/categories';
  static const String pupularBuilder = '/api/v1/sc/mainPageBuilder';
  static const String products = '/api/v1/sc/products/list';
  static const String productVariants = '/api/v1/sc/products/variants';
  static const String productDetail = '/api/v1/sc/products/show/';
  static const String productRecommendation =
      '/api/v1/sc/products/recomendationByProduct';

  //FAVORITE
  static const String listFavorite = '/api/v1/favorite'; //GET , //POST
  static const String deleteFromFavorite = '/api/v1/favorite/delete';
  static const String favorite = '/api/v1/favorite';

  //PROFILE
  static const String profile = '/api/v1/profile';
  static const String city = '/api/v1/cities';
  static const String promocode = '/api/v1/promocode';
  static const String userStatus = '/api/v1/statusUsers';
  static const String programList = '/api/v1/program/list';
  static const String userStatuses = '/api/v1/statusUser/my';
  static const String myOrders = '/api/v1/order/my';
  static const String getDetailMyOrder = '/api/v1/order/view/mobile';
  static const String about = '/api/v1/about';
  static const String subscribe = '/api/v1/subscribe';
  static const String refundProduct = '/api/v1/order/returnMobileOrder';
  static const String programLoyal = '/api/v1/program/list';

  //SEARCH
  static const String genders = '/api/v1/sc/genders';
  static const String getSections = '/api/v1/sc/getSectionByGender';
  static const String categories = '/api/v1/sc/getCategoriesBySections/';
  static const String subCategories = '/api/v1/sc/categories/sub/';
  static const String recommendationSearch =
      '/api/v1/sc/products/recommendationSearch';
  static const String rubrics = '/api/v1/blog/rubrics';
  static const String subscribes = '/api/v1/SubsribeUser';
  static const String blogs = '/api/v1/blog/rubricShow';
  static const String article = '/api/v1/blog/articleShow';
  static const String allSubsData = '/api/v1/subsribeFilterData';
  static const String removeSubs = '/api/v1/subsribeFilterData/delete/';
  static const String getSubsProducts = '/api/v1/subsribeFilterData/products/';
  static const String subsData = '/api/v1/SubsribeUser';
  static const String popularBrends = '/api/v1/brands/popular';

  /// others lists
  static const String sizes = '/api/v1/sizes';
  static const String colors = '/api/v1/colors';
  static const String pricesByGender = '/api/v1/sc/section/getFilterPriceByGender';

  ///BASKET
  static const String cart = '/api/v1/cart'; //GET, //POST
  static const String address = '/api/v1/address'; //GET, //POST
  static const String createOrder = '/api/v1/order/store'; //GET, //POST

}
