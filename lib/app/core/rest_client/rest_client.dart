// Back-end of the application

// Get will be a class of REST services
import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br/';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

// Exception if we wanna send an error from our repositories
class RestClientException implements Exception {
  final int? code;
  final String message;
  
  RestClientException(
    this.message, {
    this.code,
  });

  // Print a intelligible message for user
  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
