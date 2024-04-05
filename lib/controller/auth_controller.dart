import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  Rx<bool?> isLogin = Rx<bool?>(null);

  final String keyIsLogin = 'isLogin';
  final box = GetStorage();
  Function? boxListenerDispose;

  RxBool canPop = false.obs;

  @override
  void onInit() {
    initIsLogin();
    boxListenerDispose = box.listenKey(keyIsLogin, (value){
      GetUtils.printFunction(keyIsLogin, value, "auth controller listen");
      isLogin.value = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    boxListenerDispose?.call();
    super.dispose();
  }

  initIsLogin() {
    isLogin.value = box.read(keyIsLogin) ?? false;
  }

  void login() {
    // isLogin.value = true;
    box.write(keyIsLogin, true);
  }

  void logoff() {
    // isLogin.value = false;
    box.write(keyIsLogin, false);
  }

  void makeCanPop(bool value){
    canPop.value = value;
  }
}