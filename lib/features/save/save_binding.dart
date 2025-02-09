import 'package:get/get.dart';
import 'package:waseet_app/features/save/save_controller.dart';

class SaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SavePropertyController());
  }
}
