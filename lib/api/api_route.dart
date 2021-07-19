class APIRoute {
  static const String imageBaseUrl =
      "https://blackownedandofficial.s3.us-east-2.amazonaws.com/development/images/";

  static String averageImageUrl = imageBaseUrl + "average/";
  static String bestImageUrl = imageBaseUrl + "best/";
  static String smallImageUrl = imageBaseUrl + "small/";

  static String baseUrl = "http://3.143.99.3:3000/api/";
  static String loginUrl = baseUrl + 'user/login';

  static String signupUrl = baseUrl + 'user/signup';
}
