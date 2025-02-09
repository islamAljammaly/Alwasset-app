import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/profile/profile_controller.dart';
import 'package:waseet_app/features/profile/widgets/edit.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: MyTextStyleTajwal(
          text: 'الملف الشخصي',
          size: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: ListView(
          children: [
            SizedBox(
              height: 16.h,
            ),
            CircleAvatar(
              radius: 45.r,
              backgroundColor: const Color(0xFF1C274D),
              child: Icon(
                LineIcons.userCircleAlt,
                color: AppColors.white,
                size: 60.r,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(
              () => Center(
                  child: MyTextStyleTajwal(
                text: profileController.userData.value != null
                    ? profileController.userData.value!['userName'] ?? ''
                    : 'مستخدم',
                size: 18.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w700,
              )),
            ),

            SizedBox(
              height: 32.h,
            ),
            InkWell(
              onTap: () {
                if (LocalStorage().readValue(Constants.token) != null) {
                  profileController.showInfo.value == false
                      ? profileController.showInfo.value = true
                      : profileController.showInfo.value = false;
                } else {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                      content: Text(
                    'يرجي تسجيل الدخول',
                    style: getMyStyleTajwal(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  )));
                }
              },
              child: Obx(
                () => Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C274D),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LineIcons.infoCircle,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      MyTextStyleTajwal(
                        text: 'المزيد',
                        size: 14.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        profileController.showInfo.value == true
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 24.r,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => profileController.showInfo.isTrue
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1C274D).withOpacity(0.3),
                                blurRadius: 1,
                                spreadRadius: 0.2,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    LineIcons.mapPin,
                                    color: Color(0xFF1C274D),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  MyTextStyleTrajanPro(
                                    text: 'العنوان :',
                                    size: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grayBorder,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Obx(
                                    () => MyTextStyleTrajanPro(
                                      text: profileController.userData.value !=
                                              null
                                          ? '${profileController.userData.value!['city'] ?? ''} - ${profileController.userData.value!['street'] ?? ''}'
                                          : '-',
                                      size: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1C274D),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    LineIcons.phone,
                                    color: Color(0xFF1C274D),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  MyTextStyleTrajanPro(
                                    text: 'الجوال :',
                                    size: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grayBorder,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Obx(
                                    () => MyTextStyleTrajanPro(
                                      text: profileController.userData.value !=
                                              null
                                          ? profileController
                                                  .userData.value!['phone'] ??
                                              ''
                                          : 'xxxxxxxxxx',
                                      size: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1C274D),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            // تعديل
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () {
                if (LocalStorage().readValue(Constants.token) != null) {
                  showEditProfile(
                    context: context,
                  );
                } else {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                      content: Text(
                    'يرجي تسجيل الدخول',
                    style: getMyStyleTajwal(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  )));
                }
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C274D),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: MyTextStyleTajwal(
                    text: 'تعديل البيانات',
                    size: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),       
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await LocalStorage().removeKey(Constants.token);
                    await LocalStorage().removeKey(Constants.customerId);
                    Get.offAllNamed(AppRouting.signInView);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            spreadRadius: 0.2,
                          ),
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        MyTextStyleTajwal(
                          text:
                              LocalStorage().readValue(Constants.token) != null
                                  ? 'تسجيل خروج'
                                  : 'تسجيل دخول',
                          size: 15.sp,
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          width: 45.w,
                          height: 45.r,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1C274D),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.logout,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
