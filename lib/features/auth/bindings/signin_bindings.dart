import 'package:get/get.dart';
import 'package:waseet_app/features/auth/controller/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
