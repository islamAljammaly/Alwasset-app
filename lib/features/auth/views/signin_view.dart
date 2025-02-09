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
import 'package:waseet_app/features/auth/controller/signin_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
                    onPressed: () =>
                        Get.toNamed(AppRouting.bottomNavigationBarView),
                    icon: const Icon(
                      LineIcons.arrowLeft,
                      color: Color(0xFF1C274D),
                    )),
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
              SizedBox(
                height: 130.h,
              ),
              MyTextStyleTajwal(
                text: 'تسجيل جديد',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                autofillHints: const [AutofillHints.telephoneNumber],
                controller: controller.phoneNumbertextEditingController,
                cursorColor: Colors.yellow,
                validator: (val){
                  if(val!.isEmpty) {
                    return 'يرجى ادخال رقم الجوال';
                  } else if(val.isPhoneNumber == false) {
                    return 'يرجى ادخال الرقم بشكل صحيح';
                  }
                  return null;
                },
                focusNode: controller.focusNode,
                decoration: InputDecoration(
                    hintText: 'رقم الجوال',
                    fillColor: const Color(0xFFF9F9FA),
                    filled: true,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/mobile.svg'),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    enabledBorder: borderSignIn,
                    focusedBorder: borderSignIn,
                    border: borderSignIn,
                    disabledBorder: borderSignIn),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      10), // هنا تحديد الحد الأقصى للأرقام
                  FilteringTextInputFormatter
                      .digitsOnly, // التأكد من أنه يمكن إدخال أرقام فقط
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              InkWell(
                onTap: () {
                  if (controller.formSignInKey.currentState?.validate() ?? false) {
                    print('${controller.phoneNumbertextEditingController.text}');
                    controller.checkPhoneNumberAndNavigate();
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
                                text: 'التالي',
                                size: 16.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
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
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextButton(
                      onPressed: () => Get.toNamed(AppRouting.loginView),
                      child: MyTextStyleTajwal(
                        text: 'سجل دخول',
                        size: 12.sp,
                        color: const Color(0xFF0B4E6C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
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