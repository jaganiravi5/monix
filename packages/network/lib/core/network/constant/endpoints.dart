class Endpoints {
  // development base url
  static const String baseUrl = 'https://api.deepgram.com/v1';

  // receiveTimeout
  static const int receiveTimeout = 25;

  // connectTimeout
  static const int connectionTimeout = 60;

  // speechToText
  static const String speechToText = '$baseUrl/listen';
}
