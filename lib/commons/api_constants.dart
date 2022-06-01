class API {
  static String baseUrl = "https://api.panaux.com/";
  static String signup = baseUrl + "api/clients/signup";
  static String login = baseUrl + "api/clients/signin";
  static String emailVerification = baseUrl +
      "api/clients/verify_email_register";
  static String forgetPassword = baseUrl + "api/clients/forgotPassword/";
  static String privacyPolicy = baseUrl + "api/privacy_policy/";
  static String faq = baseUrl + "api/faq/";
  static String walletBalanceApi = baseUrl + "api/wallet/client/CBalance";
  static String walletHistoryApi = baseUrl + "api/wallet/client/transactions";
  //static String withdrawalApi = baseUrl + "api/wallet/vendor/widthrawl";
  static String addMoneyToWallet = baseUrl + "api/wallet/client/deposite";
  static String updatePasswordApi = baseUrl + "api/clients/change_password/";
  static String userProfileApi = baseUrl + "api/clients/profile/get/";
  static String bookingApi = baseUrl + "api/doctor_booking/";
  static String doctorsApi = baseUrl + "api/doctors/";
  static String editAddressApi = baseUrl + "api/clients/address";
  static String pharmacyApi = baseUrl + "api/vendors/";
  static String addOrderApi = baseUrl + "api/order/add_order/";


}
