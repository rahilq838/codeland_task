import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;

  // void toggleIsLogin() {
  //   isLogin.value = !isLogin.value;
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void login() {
    isLogin.value = true;
  }

  void logoff() {
    isLogin.value = false;
  }
}