import 'package:get/get.dart';
import 'package:waseet_app/features/home/controller.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerHome());
  }
}
