import 'package:get/get.dart';
import 'package:waseet_app/features/bottom_navigation_bar/bottom_vavigation_bar_controller.dart';

class BottomNavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
  }
}
