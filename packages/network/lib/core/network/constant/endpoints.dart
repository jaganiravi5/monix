class Endpoints {
  // development base url
  static const String baseUrl = 'https://monix-be.onrender.com';

  // receiveTimeout
  static const int receiveTimeout = 25;

  // connectTimeout
  static const int connectionTimeout = 60;

  // speechToText
  static const String allCategory = '$baseUrl/api/v1/category';
  static const String allImages = '$baseUrl/api/v1/images';
}
