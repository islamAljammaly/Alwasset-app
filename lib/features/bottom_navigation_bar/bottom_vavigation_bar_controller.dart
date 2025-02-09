import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/routing.dart';

class BottomNavigationBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt bottomNavIndex = 0.obs;
  late PageController pageController;
  RxBool showButtons = false.obs;

  late AnimationController animationController;
  late Animation<double> animationn;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationn = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    Map<String, String>? parameter = Get.arguments as Map<String, String>?;
    String? index = parameter?['bottomNavIndex'];
    if (parameter == null) {
      pageController = PageController(initialPage: bottomNavIndex.value);
    } else {
      bottomNavIndex(int.parse(index!));
      pageController = PageController(initialPage: bottomNavIndex.value);
    }
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    animationController.dispose();
    super.onClose();
  }

  void toggleButtons() {
    showButtons.value = !showButtons.value;
    if (showButtons.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void onTappedBar(int value) {
    bottomNavIndex.value = value;

    pageController.jumpToPage(value);
  }

  void changePage(int index) {
    bottomNavIndex.value = index;
  }

  onItemSelected(int value) {
    bottomNavIndex.value = value;
    pageController.jumpToPage(value);
  }

  void pushNavigationBar(int index) async {
    log('index Btn ::${bottomNavIndex.value}');

    Get.offAllNamed(AppRouting.bottomNavigationBarView, arguments: {
      'bottomNavIndex': '2',
    });
  }

  void pushNavigationStore(int index) async {
    log('index Btn ::${bottomNavIndex.value}');

    Get.offAllNamed(AppRouting.bottomNavigationBarView, arguments: {
      'bottomNavIndex': '1',
    });
  }
}
