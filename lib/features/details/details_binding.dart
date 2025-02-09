import 'package:get/get.dart';
import 'package:waseet_app/features/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(), fenix: true);
  }
}
