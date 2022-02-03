import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  // Listening to any change on getStorage
  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (value != null) {
      //   _isLogged(true); // User is logged
      // } else {
      //   _isLogged(false);
      // }
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    // final isLoggedData = getUserId() != null;
    _isLogged(getUserId() != null);

    return this;
  }

  // Logout method
  void logout() => _getStorage.write(Constants.USER_KEY, null);
  // Recover Logged User ID
  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
