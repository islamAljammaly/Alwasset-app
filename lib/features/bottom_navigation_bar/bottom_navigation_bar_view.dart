import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/bottom_navigation_bar/bottom_vavigation_bar_controller.dart';
import 'package:waseet_app/features/bottom_navigation_bar/widgets/dialog_helper.dart';
import 'package:waseet_app/features/home/home_view.dart';
import 'package:waseet_app/features/my_property/my_properties_view.dart';
import 'package:waseet_app/features/profile/profile_view.dart';
import 'package:waseet_app/features/save/save_view.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  // ignore: use_super_parameters
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(246, 250, 250, 250),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                String? token = LocalStorage().readValue<String>(Constants.token);
                if(token == null) {
                  DialogHelper.showDialogIcon(
                      icon: SvgPicture.asset(
                        'assets/svg/add-property.svg',
                        width: 70.w,
                        height: 50.h,
                      ),
                      dialogText: 'يرجى تسجيل الدخول حتي تتمكن من اضافة عقارك',
                      buttonText: 'تسجيل الدخول',
                      onTap: () {
                        Get.offAllNamed(AppRouting.signInView);
                      });
                } else {
                  Get.offAllNamed(AppRouting.addPropertyView1);
                }
              },
              child: Transform.rotate(
                angle: 7,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Transform.rotate(
                    angle: 4,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Obx(() => getBottomNavigationBar(controller.bottomNavIndex.value)),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.changePage(index);
        },
        children: const [
          ViewHome(),
          MyPropertiesView(),
          SavedView(),
          ProfileView()
        ],
      ),
    );
  }
}

getBottomNavigationBar(int currentIndex) => ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(32.r),
        topLeft: Radius.circular(32.r),
      ),
      child: BottomNavigationBar(
        elevation: 2.r,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) => Get.find<BottomNavigationBarController>().onItemSelected(index),
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        selectedItemColor: Colors.blue, // اللون الأزرق للعناصر المحددة
        unselectedItemColor: const Color(0xFF1C274D), // اللون الرمادي للعناصر غير المحددة
        iconSize: 24.r,
        selectedLabelStyle: getMyStyleTrajanPro(fontWeight: FontWeight.bold),
        unselectedLabelStyle: getMyStyleTrajanPro(fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(
            label: 'الرئيسية'.tr,
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              color: currentIndex == 0 ? Colors.blue : Color(0xFF1C274D),
            ),
          ),
          BottomNavigationBarItem(
            label: 'عقاراتي'.tr,
            icon: SvgPicture.asset(
              'assets/svg/myProperties.svg',
              color: currentIndex == 1 ? Colors.blue : Color(0xFF1C274D),
            ),
          ),
          BottomNavigationBarItem(
            label: 'المحفوظات'.tr,
            icon: SvgPicture.asset(
              'assets/svg/old_save.svg',
              color: currentIndex == 2 ? Colors.blue : Color(0xFF1C274D),
            ),
          ),
          BottomNavigationBarItem(
            label: 'حسابي'.tr,
            icon: SvgPicture.asset(
              'assets/svg/user.svg',
              color: currentIndex == 3 ? Colors.blue : Color(0xFF1C274D),
            ),
          ),
        ],
      ),
    );
