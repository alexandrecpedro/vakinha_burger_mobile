// Interface for Login (System authentication)
// User register an automatically goes to login page
import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // RestClient instance
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    // Get, by default, don't send an error if there is found an error
    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      // Error 400 = any other error from register (e.g. user already exists, email already exists, etc)
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      // Log from 'dart:developer' (Print is not a good pratice. It shouldn't be used on production)
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      // Uploading an exception
      throw RestClientException(message);
    }

    // If there isn't an error, user will be logged
    return UserModel.fromJson('source');
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth', {
      'email': email,
      'password': password,
    });

    // Implementing 'decoder' (from GetX) in a different manner
    if (result.hasError) {
      // 403 = Forbidden / Denied access
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        // Specific exception
        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusCode,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }
}
