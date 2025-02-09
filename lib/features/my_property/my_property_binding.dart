import 'package:get/get.dart';
import 'package:waseet_app/features/my_property/my_properties_controller.dart';

class MyPropertiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPropertiesController());
  }
}
