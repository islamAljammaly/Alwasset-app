import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/sizes.dart';
import 'package:waseet_app/core/public_widgets/drop_down_button_provider.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/features/auth/views/login_view.dart';
import 'package:waseet_app/features/profile/profile_controller.dart';

void showEditProfile({
  required BuildContext context,
}) =>
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        constraints: BoxConstraints(
          minHeight: AppSizes.h120,
        ),
        context: context,
        builder: (context) {
          List<String?>? itemCity = ['غزة', 'خانيونس', 'رفح', 'الوسطي'];
          List<String?>? itemSreet = [
            'النصر',
            'الجلاء',
            'الوحدة',
            'صلاح الدين'
          ];
          var profileController = Get.put(ProfileController());
          final user = profileController.userData.value!;
          profileController.fullNameTextEditingController =
              TextEditingController(text: '${user['userName']}');
          profileController.addressTextEditingController =
              TextEditingController(text: '${user['address']}');
          profileController.year.value = user['year'];
          profileController.cityName.value = user['city'];
          profileController.blockName.value = user['street'];

          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                right: AppSizes.w16,
                left: AppSizes.w16,
                top: AppSizes.h16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextStyleTajwal(
                        text: 'تعديل الحساب',
                        size: FontSizes.sp12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close)),
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.h16,
                  ),
                  // text name
                  TextFormField(
                    controller: profileController.fullNameTextEditingController,
                    cursorColor: Colors.yellow,
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
                    height: AppSizes.h8,
                  ),
                  // city
                  Obx(
                    () => DropDownButtonProvider(
                        items: itemCity
                            .map((element) => element.toString())
                            .toList(),
                        selectedValue: profileController.cityName.value,
                        selectItem: 'اختر المدينة',
                        iconData: const Icon(
                          LineIcons.arrowDown,
                          color: Color(0xFF169BD7),
                        ),
                        onchanged: (item) {
                          profileController.cityName.value = item!;
                        }),
                  ),
                  SizedBox(
                    height: AppSizes.h8,
                  ),
                  // block
                  Obx(
                    () => DropDownButtonProvider(
                        items: itemSreet
                            .map((element) => element.toString())
                            .toList(),
                        selectedValue: profileController.blockName.value != ''
                            ? profileController.blockName.value
                            : null,
                        selectItem: 'اختر الحى',
                        iconData: const Icon(
                          LineIcons.arrowDown,
                          color: Color(0xFF169BD7),
                        ),
                        onchanged: (item) {
                          profileController.blockName.value = item!;
                        }),
                  ),
                  SizedBox(
                    height: AppSizes.h8,
                  ),
                  Obx(
                    () => DropDownButtonProvider(
                        items: Constants.year,
                        selectedValue: profileController.year.value,
                        selectItem: 'اختر الميلاد',
                        iconData: const Icon(
                          LineIcons.calendarCheck,
                          color: Color(0xFF169BD7),
                        ),
                        onchanged: (item) {
                          profileController.year.value = item!;
                          log(item);
                        }),
                  ),

                  // year
                  SizedBox(
                    height: AppSizes.h8,
                  ),
                  // btn
                  Obx(
                    () => InkWell(
                      onTap: () => profileController.updateUserData(),
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 1.0],
                            colors: [
                              Color(0xFF1C274D),
                              Color(0xFF0B4E6C),
                            ],
                          ),
                        ),
                        child: profileController.loddingUpdate.isTrue
                            ? const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: AppColors.grayBorder,
                                  color: AppColors.white,
                                ),
                              )
                            : Center(
                                child: MyTextStyleTajwal(
                                    text: 'حفظ',
                                    size: 16.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.h8,
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
    });
