import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/auth/controller/login_controller.dart';
import 'package:waseet_app/features/auth/views/verification_code_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool secourText = false.obs;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 8.w),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color(0xFFF0F9FD),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () => Get.toNamed(AppRouting.bottomNavigationBarView),
                  icon: const Icon(LineIcons.arrowLeft, color: Color(0xFF1C274D)),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: controller.formSignInKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(height: 130.h),
              MyTextStyleTajwal(
                text: 'تسجيل دخول',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                autofillHints: const [AutofillHints.telephoneNumber],
                controller: controller.phoneNumbertextEditingController,
                cursorColor: Colors.yellow,
                focusNode: controller.focusNode,
                decoration: InputDecoration(
                  hintText: 'رقم الجوال',
                  fillColor: const Color(0xFFF9F9FA),
                  filled: true,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/svg/mobile.svg'),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  enabledBorder: borderSignIn,
                  focusedBorder: borderSignIn,
                  border: borderSignIn,
                  disabledBorder: borderSignIn,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال رقم الهاتف';
                  }
                  if (value.length != 10) {
                    return 'رقم الهاتف يجب أن يكون مكونًا من 10 أرقام';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),

              // Password Field with Validation
              Obx(
                () => TextFormField(
                  controller: controller.passwordtextEditingController,
                  cursorColor: Colors.yellow,
                  obscureText: !secourText.value,
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                    fillColor: const Color(0xFFF9F9FA),
                    filled: true,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        secourText.value = !secourText.value;
                      },
                      icon: Icon(
                        secourText.value ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xFF169BD7),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    enabledBorder: borderSignIn,
                    focusedBorder: borderSignIn,
                    border: borderSignIn,
                    disabledBorder: borderSignIn,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال كلمة المرور';
                    }
                    if (value.length < 6) {
                      return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 8.h),

              // Forgot Password Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (controller.phoneNumbertextEditingController.text.isEmpty) {
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text(
                              'الرجاء إدخال رقم الهاتف',
                              style: getMyStyleTajwal(
                                  fontWeight: FontWeight.normal, color: Colors.white),
                            ),
                          ),
                        );
                      } else{
                        Get.to(() => OTPView(phoneNumber: controller.phoneNumbertextEditingController.text.trim()));
                      }
                    },
                    child: MyTextStyleTajwal(
                      text: 'نسيت كلمة المرور ؟',
                      fontWeight: FontWeight.w500,
                      size: 13.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Login Button with Validation Check
              InkWell(
                onTap: () {
                  if (controller.formSignInKey.currentState!.validate()) {
                    controller.signInWithPhoneAndPassword(
                      controller.phoneNumbertextEditingController.text.trim(),
                      controller.passwordtextEditingController.text.trim(),
                    );
                  }
                },
                child: Obx(
                  () => Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFF0B4E6C),
                          Color(0xFF169BD7),
                        ],
                      ),
                    ),
                    child: controller.lodding.isTrue
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.grayBorder,
                              color: AppColors.white,
                            ),
                          )
                        : Center(
                            child: MyTextStyleTajwal(
                              text: 'دخول',
                              size: 16.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Sign Up Navigation
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextStyleTrajanPro(
                    text: 'هل تمتلك حساب ؟',
                    size: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 8.w),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRouting.signUpView),
                    child: MyTextStyleTajwal(
                      text: 'تسجيل جديد',
                      size: 12.sp,
                      color: const Color(0xFF0B4E6C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


OutlineInputBorder borderSignIn = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: const BorderSide(color: Colors.transparent, width: 0));
