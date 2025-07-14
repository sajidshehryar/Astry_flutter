class ApiConstants {
  ApiConstants._();
  static const String baseUrl = "http://157.173.218.220:7000";

  /*----------------------------------------------- End Point Urls ---------------------------------------*/

  static const String getOtp = "$baseUrl/auth/otpSend";
  static const String verifyOtp = "$baseUrl/auth/otpverify";
  static const String checkNumber = "$baseUrl/auth/checkNumber";
  static const String getAstrology = "$baseUrl/astrology/getAstrology";
  static const String getCompatibility = "$baseUrl/auth/getCompatibilityList";
  static const String getKnowledge = "$baseUrl/knowledge/getKnowledge";
  static const String getProfile = "$baseUrl/auth/getprofile";

  static const String getHoroscopeData = "$baseUrl/thirdPartyRouter/getHoroscopePrediction";
  static const String getNatalChart= "$baseUrl/thirdPartyRouter/getNatalChartInterpretation";
  static const String getNumerology = "$baseUrl/thirdPartyRouter/getNumerologyNumbers";
  static const String getNumerologyReport = "$baseUrl/thirdPartyRouter/getNumeroReport";
  static const String getNatalChartImage = "$baseUrl/thirdPartyRouter/getNatalChartWheel";

  static const String updateProfile = "$baseUrl/auth/updateProfile";





}
