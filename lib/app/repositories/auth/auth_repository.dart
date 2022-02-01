// Interface for Login (System authentication)
import 'package:vakinha_burger_mobile/app/models/user_model.dart';

abstract class AuthRepository {
  // 1st method = register
  Future<UserModel> register(String name, String email, String password);
  // 2nd method = login
  Future<UserModel> login(String email, String password);
}