import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waseet_app/features/home/property_modal.dart';

class DetailsController extends GetxController {
  RxBool lodding = false.obs;
  final property = Get.arguments as PropertyModel;
  PageController controller = PageController(viewportFraction: 0.9);
  

  var list = <PropertyModel>[].obs;
  @override
  void onInit() {
    log('message list :: $property');
    super.onInit();
  }
}
