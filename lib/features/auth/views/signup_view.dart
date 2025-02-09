import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/public_widgets/drop_down_button_provider.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/features/auth/controller/signup_controller.dart';
import 'package:waseet_app/features/auth/views/signin_view.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String?>? itemCity = ['غزة', 'خانيونس', 'رفح', 'الوسطي'];
    List<String?>? itemSreet = ['النصر', 'الجلاء', 'الوحدة', 'صلاح الدين'];

    RxBool isValidCity = false.obs;
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
                      onPressed: () => Get.back(),
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
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  autofillHints: const [AutofillHints.name],
                  controller: controller.nameTextEditingController,
                  cursorColor: Colors.yellow,
                  validator: (val) {
                    if(val!.isEmpty || val.isNum) {
                      return 'error';
                    }
                    return null;
                  },
                  //focusNode: controller.focusNode,
                  decoration: InputDecoration(
                      hintText: 'الأسم والعائلة',
                      fillColor: const Color(0xFFF9F9FA),
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/user-square.svg'),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 15),
                      enabledBorder: borderSignIn,
                      focusedBorder: borderSignIn,
                      border: borderSignIn,
                      disabledBorder: borderSignIn),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.passowrdtextEditingController,
                    cursorColor: Colors.yellow,
                    obscureText: secourText.value != false ? false : true,
                    validator: (val){
                      if(val!.isEmpty || val.length < 7) {
                      return 'invalid password';
                    }
                    return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'كلمة المرور',
                        fillColor: const Color(0xFFF9F9FA),
                        filled: true,
                        suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              secourText.value == false
                                  ? secourText.value = true
                                  : secourText.value = false;
                            },
                            icon: Icon(
                              secourText.value != false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFF169BD7),
                            )),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 15),
                        enabledBorder: borderSignIn,
                        focusedBorder: borderSignIn,
                        border: borderSignIn,
                        disabledBorder: borderSignIn),
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[0-9a-zA-Z]')), // الأرقام والأحرف الإنجليزية فقط
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => DropDownButtonProvider(
                      items: itemCity
                          .map((element) => element.toString())
                          .toList(),
                      selectedValue: controller.cityName.value != ''
                          ? controller.cityName.value
                          : null,
                      selectItem: 'اختر المدينة',
                      iconData: const Icon(
                        LineIcons.arrowDown,
                        color: Color(0xFF169BD7),
                      ),
                      onchanged: (item) {
                        controller.cityName.value = item!;
                      }),
                ),
                Obx(
                  () => isValidCity.isFalse
                      ? const SizedBox()
                      : const Text('* حقل مطلوب',
                          style: TextStyle(color: Colors.red)),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => DropDownButtonProvider(
                      items: itemSreet
                          .map((element) => element.toString())
                          .toList(),
                      selectedValue: controller.streetName.value != ''
                          ? controller.streetName.value
                          : null,
                      selectItem: 'اختر المحافظة',
                      iconData: const Icon(
                        LineIcons.arrowDown,
                        color: Color(0xFF169BD7),
                      ),
                      onchanged: (item) {
                        controller.streetName.value = item!;
                      }),
                ),

                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  autofillHints: const [AutofillHints.addressCityAndState],
                  controller: controller.addressstextEditingController,
                  cursorColor: Colors.yellow,
                  validator: (val) {
                    if(val!.isEmpty || val.isNum) {
                      return 'error';
                    }
                    return null;
                  },
                  //focusNode: controller.focusNode,
                  decoration: InputDecoration(
                      hintText: 'أقرب معلم _ مسجد _ شارع',
                      fillColor: const Color(0xFFF9F9FA),
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LineIcons.streetView,
                          color: Color(0xFF169BD7),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 15),
                      enabledBorder: borderSignIn,
                      focusedBorder: borderSignIn,
                      border: borderSignIn,
                      disabledBorder: borderSignIn),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => DropDownButtonProvider(
                      items: Constants.year,
                      selectedValue: controller.year.value != ''
                          ? controller.year.value
                          : null,
                      selectItem: 'اختر الميلاد',
                      iconData: const Icon(
                        LineIcons.calendarCheck,
                        color: Color(0xFF169BD7),
                      ),
                      onchanged: (item) {
                        controller.year.value = item!;
                        log(item);
                      }),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.year.value != '' && controller.cityName.value != '' && controller.streetName.value != '') {
                        controller.signup(
                            phoneNumber: controller
                                .phonetextEditingController.text
                                .trim(),
                            password: controller
                                .passowrdtextEditingController.text
                                .trim(),
                            userName: controller.nameTextEditingController.text
                                .trim(),
                            city: controller.cityName.value,
                            street: controller.streetName.value);
                        // controller.addCustomer();
                      } else {
                        ScaffoldMessenger.of(Get.context!)
                            .showSnackBar(SnackBar(
                                backgroundColor: AppColors.red,
                                content: Text(
                                  'ادخل تاريخ الميلاد',
                                  style: getMyStyleTajwal(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )));
                      }
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
                      child: controller.isLoading.isTrue
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
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ));
  }
}

