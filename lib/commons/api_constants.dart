class API {
  static String baseUrl = "https://desi-health-api.herokuapp.com/";
  static String signup = baseUrl + "vendorSignup";
  static String login = baseUrl + "vendorSignin";
  static String emailVerification = baseUrl + "api/vendorApp/verify_email_register";
  static String forgetPassword = baseUrl + "api/vendorApp/forgetPassword";
  static String privacyPolicy = baseUrl + "api/privacy_policy/";
  static String faq = baseUrl + "api/faq/";
  static String documentsApi = baseUrl + "api/vendorD/documents";
  static String newOrders = baseUrl + "api/vendor/order/v_new_orders";
  static String processingOrders =
      baseUrl + "api/vendor/order/v_processing_orders";
  static String paidOrders = baseUrl + "api/vendor/order/v_paid_orders";
  static String dispatchedOrders =
      baseUrl + "api/vendor/order/v_dispatched_orders";
  static String deliveredOrders =
      baseUrl + "api/vendor/order/v_delivered_orders";
  static String orderDetails = baseUrl + "api/order";
  static String searchProducts = baseUrl + "api/product/search/";
  static String updateOrder = baseUrl + "api/vendor/order/v_update_order/";
  static String brandsApi = baseUrl + "api/brand/";
  static String taxApi = baseUrl + "api/tax/view_tax/";
  static String unitApi = baseUrl + "api/units/";
  static String categoryApi = baseUrl + "api/category/";
  static String addProductApi = baseUrl + "api/vendor/product/add_product/";
  static String getProductApi = baseUrl + "api/vendor/product/";
  static String editProductApi = baseUrl + "api/vendor/product/edit_product/";
  static String addBrandApi = baseUrl + "api/vendor/brand/add_brand/";
  static String getBrandApi = baseUrl + "api/vendor/brand";
  static String deleteBrandApi = baseUrl + "api/vendor/brand/update_brand/";
  static String walletBalanceApi = baseUrl + "api/wallet/vendor/VBalance/";
  static String walletHistoryApi = baseUrl + "api/wallet/vendor/Vtransactions";
  static String updateProfileApi = baseUrl + "api/vendorApp/panel/";
  static String withdrawalApi = baseUrl + "api/wallet/vendor/widthrawl";
  static String updatePasswordApi = baseUrl + "api/vendorApp/updatePassword";
  static String earningsBalance = baseUrl + "api/earning/vendor/balance";
  static String earningsTransactions = baseUrl + "api/earning/vendor";
}
