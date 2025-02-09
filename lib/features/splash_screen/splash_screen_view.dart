import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/images.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: const Color(0xFF1C274D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<SplashScreenController>(
            builder: (_) { 
              return AnimatedBuilder(
                animation: controller.animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.rotationY(controller.animation.value * 3.14 * 2),
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: controller.animation.value,
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  ImageApp.logo,
                  color: AppColors.white,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Obx(
            () => AnimatedOpacity(
              opacity: controller.showText.value ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: MyTextStyleTrajanPro(
                text: 'AL Waseet',
                size: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}