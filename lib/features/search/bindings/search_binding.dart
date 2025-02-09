import 'package:get/get.dart';
import 'package:waseet_app/features/search/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchFilterController());
  }
}
