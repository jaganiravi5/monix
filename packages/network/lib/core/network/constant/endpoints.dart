class Endpoints {
  // development base url
  static const String baseUrl = 'http://51.20.12.79:5001';

  // receiveTimeout
  static const int receiveTimeout = 25;

  // connectTimeout
  static const int connectionTimeout = 60;

  // speechToText
  static const String allCategory = '$baseUrl/api/v1/category';
  static const String allImages = '$baseUrl/api/v1/images';
  static const String subCategory = '$baseUrl/api/v1/subCategory';
  static const String suggetion = '$baseUrl/api/v1/suggestion/add';
}
