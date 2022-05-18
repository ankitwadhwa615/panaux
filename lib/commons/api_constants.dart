class API {
  static String baseUrl = "https://api.panaux.com/";
  static String signup = baseUrl + "api/clients/signup";
  static String login = baseUrl + "api/clients/signin";
  static String emailVerification = baseUrl + "api/clients/verify_email_register";
  static String forgetPassword = baseUrl + "api/clients/forgotPassword/";
  static String privacyPolicy = baseUrl + "api/privacy_policy/";
  static String faq = baseUrl + "api/faq/";
  static String documentsApi = baseUrl + "api/vendorD/documents";
  static String walletBalanceApi = baseUrl + "api/wallet/vendor/VBalance/";
  static String walletHistoryApi = baseUrl + "api/wallet/vendor/Vtransactions";
  static String updateProfileApi = baseUrl + "api/clients/profile/get";
  static String withdrawalApi = baseUrl + "api/wallet/vendor/widthrawl";
  static String updatePasswordApi = baseUrl + "api/clients/change_password/";
}
