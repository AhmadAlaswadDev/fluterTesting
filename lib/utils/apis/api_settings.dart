
class ApiSettings{

  //---------------------------MAIN LINK----------------------------------------
  static const String _baseUrl= "https://dev.zaheed.sa/";
  // static const String _baseUrl= "http://127.0.0.1/activeCommerce/";
  //---------------------------API LINK-----------------------------------------
  static const String _apiUrl= "${_baseUrl}api/v2/";
  //---------------------------AUTH LINKS---------------------------------------
  static const String register = "${_apiUrl}auth/signup";
  static const String login = "${_apiUrl}auth/login";
  static const String logout = "${_apiUrl}auth/logout";
  static const String loginWithPhone = "${_apiUrl}auth/login-with-phone-req";
  static const String activatePhone = "${_apiUrl}auth/login-with-phone-exec";
  //---------------------------HOME LINKS---------------------------------------
  static const String home = "${_apiUrl}layouts/home";
  static const String searchProducts = "${_apiUrl}products/search";
  //---------------------------CATEGORY LINK------------------------------------
  static const String category = "${_apiUrl}categories";
  //---------------------------SHOP CATEGORY LINK-------------------------------
  static const String shopCategory = "${_apiUrl}layouts/main-category-one/";
  static const String shopDetail = "${_apiUrl}shops/details/";
  static const String shopFollow = "${_apiUrl}shops/follow/";
  static const String shopUnfollow = "${_apiUrl}shops/unfollow/";
  static const String shopPages = "${_apiUrl}shops/"; //=> shops/30/pages
  static const String productPages = "${_apiUrl}shops/"; // =>shops/30/pages/7
  //---------------------------PRODUCT LINK-------------------------------------
  static const String productDetail = "${_apiUrl}products/";
  //---------------------------BESTSELLER LINK----------------------------------
  static const String bestSeller = "${_apiUrl}products/best-seller";
  //---------------------------CITY LINK----------------------------------------

  //---------------------------NEARBY STORE MODEL LINK--------------------------
  static const String nearByStore = "${_apiUrl}shops/nearby";
  //---------------------------FAQS LINK----------------------------------------

  //---------------------------CONTACT LINK-------------------------------------

  //---------------------------FAVORITE LINK------------------------------------
  static const String shopFavorite = "${_apiUrl}shops/favorite";
  static const String removeShopFavorite = "${_apiUrl}shops/favorite/remove";
  static const String addShopFavorite = "${_apiUrl}shops/favorite/add";

  static const String productFavorite = "${_apiUrl}wishlists";
  static const String removeProductFavorite = "${_apiUrl}wishlists/remove";
  static const String addProductFavorite = "${_apiUrl}wishlists/add";
  //-----------------------------POLICIES LINK----------------------------------
  static const String privacyPolicies = "${_apiUrl}policies/privacy";
  static const String termsPolicies = "${_apiUrl}policies/termsConditions";
  //---------------------------Carts LINK---------------------------------------
  static const String carts = "${_apiUrl}carts";
  static const String removeItem = "${_apiUrl}carts/";
  static const String addItem = "${_apiUrl}carts/add";


  //---------------------------MY ORDER LINK------------------------------------
  static const String myOrder = "${_apiUrl}purchase-history";
  //---------------------------PAYMENT LINK-------------------------------------
  static const String createOrder = "${_apiUrl}order/store";
  static const String getTelrURL = "${_apiUrl}telr/init";






}