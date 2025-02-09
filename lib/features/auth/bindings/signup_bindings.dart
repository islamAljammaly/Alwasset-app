import 'package:get/get.dart';
import 'package:waseet_app/features/auth/controller/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
