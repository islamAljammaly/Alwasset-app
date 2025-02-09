import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/constant/sizes.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';

class DialogHelper {
  static void showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Theme.of(context).iconTheme.color,
      titleText: InkWell(
        onTap: () => Get.offAllNamed(AppRouting.signInView),
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
        ),
      ),
      messageText: InkWell(
        onTap: () => Get.offAllNamed(AppRouting.signInView),
        child: Text(
          message,
          style: TextStyle(
              color: Theme.of(context).dialogBackgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 700),
    );
  }

  static void showSnackBarPhoneProfile({
    required String title,
    required String message,
    required Color backgroundColor,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Theme.of(context).iconTheme.color,
      titleText: InkWell(
        onTap: () => Get.offAllNamed(AppRouting.signInView),
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
        ),
      ),
      messageText: InkWell(
        onTap: () {},
        child: Text(
          message,
          style: TextStyle(
              color: Theme.of(context).dialogBackgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 700),
    );
  }

  static void showSnackBarLink({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.black,
      titleText: InkWell(
        onTap: () => Get.offAllNamed(AppRouting.signInView),
        child: Text(
          title,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
      messageText: InkWell(
        onTap: () {},
        child: Text(
          message,
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 700),
    );
  }

  static void showDialog({
    required String dialogText,
    //required IconData iconData,
    required String buttonText,
    required Function()? onTap,
    Color? iconColor = Colors.blue,
  }) {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      content: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            dialogText,
            textAlign: TextAlign.center,
            style: getMyStyleTajwal(
                size: FontSizes.sp12 + 1,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          const SizedBox(height: 20),
        ],
      ),
      confirm: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
        ),
        child: Text(
          buttonText,
          style: getMyStyleTajwal(
              size: FontSizes.sp12 + 1,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
      ),
    );
  }

  static void showDialogIcon({
    required String dialogText,
    required Widget icon,
    required String buttonText,
    required Function()? onTap,
    Color? iconColor = Colors.blue,
  }) {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 1, fontWeight: FontWeight.w100),
      content: Column(
        children: [
          icon,
          const SizedBox(height: 20),
          Text(
            dialogText,
            textAlign: TextAlign.center,
            style: getMyStyleTajwal(
                size: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          const SizedBox(height: 20),
        ],
      ),
      confirm: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
        ),
        child: Text(
          buttonText,
          style: getMyStyleTajwal(
              size: FontSizes.sp12 + 1,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
      ),
    );
  }

  static void hideDialog() {
    Get.back();
  }

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text(
                message ?? 'انتظر...',
                style: const TextStyle(color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    // print()
    if (Get.isDialogOpen!) Get.back();
  }
}
