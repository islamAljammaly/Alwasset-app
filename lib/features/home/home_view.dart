import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/images.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/home/controller.dart';
import 'package:waseet_app/features/notifications/notifications_view.dart';
import 'package:waseet_app/features/search/views/filter_view.dart';

class ViewHome extends GetView<ControllerHome> {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerHome controller = Get.put(ControllerHome());
    return Scaffold(
      backgroundColor: Colors.white,

      //2effb9
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: IconButton(
            onPressed: () {Get.to(const NotificationPage());},
            icon: SvgPicture.asset(
              'assets/svg/notification.svg',
              width: 32.w,
              height: 32.h,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              MyTextStyleTrajanPro(
                text: 'AL Waseet',
                size: 13.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C274D),
              ),
            ],
          ),
          Image.asset(
            ImageApp.logo,
            color: const Color(0xFF1C274D),
          ),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () => Get.to(const FilterView()),
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(width: 1.2.r, color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          MyTextStyleTrajanPro(
                            text: 'بحث باسم المشروع',
                            size: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/svg/zoom.svg',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Get.to(const FilterView()),
                    child: Container(
                      width: 70.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFF1C274D),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              spreadRadius: 0.5,
                            ),
                          ]),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/filter.svg',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 4.r,
              runSpacing: 8.r,
              children: [
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(8.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xFF1C274D).withOpacity(0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/land.svg',
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: 'أراضي',
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(8.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color.fromARGB(255, 99, 177, 172),
                  ),
                  //const Color(0xFF07dfd0)
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/myProperties.svg',
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: 'فنادق',
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(8.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xFF1C274D).withOpacity(0.6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/house.svg',
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: 'منازل',
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                MyTextStyleTrajanPro(
                  text: 'عقارات',
                  size: 16.sp,
                  color: const Color(0xFF1C274D),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 5.w,
                ),
                MyTextStyleTrajanPro(
                  text: 'مميزة',
                  size: 16.sp,
                  color: const Color.fromARGB(255, 99, 177, 172),
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                MyTextStyleTrajanPro(
                  text: 'الكل',
                  size: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 200.h,
              child: Obx(
                () => controller.isLoadingDistinctive.isTrue
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(2, (index) {
                            return SingleChildScrollView(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                enabled: true,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  height: 200.h,
                                  width: 200.w,
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                var property =
                                    controller.propertyListDistinctive[index];
                                Get.toNamed(AppRouting.detailsView,
                                    arguments: property);
                                log('list data ::${controller.propertyListDistinctive[index]}');
                              },
                              child: Container(
                                margin: EdgeInsets.all(4.r),
                                width: 200.w,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 1,
                                        spreadRadius: 0.5,
                                      ),
                                    ]),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          image: DecorationImage(
                                            image: NetworkImage(controller
                                                    .propertyListDistinctive[
                                                        index]
                                                    .images?[0] ??
                                                ''),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(8.r),
                                                  padding: EdgeInsets.all(2.r),
                                                  width: 60.w,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color.fromARGB(255, 99, 177, 172),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                  ),
                                                  child: Center(
                                                    child: MyTextStyleTrajanPro(
                                                      text: controller
                                                              .propertyListDistinctive[
                                                                  index]
                                                              .typesOwnership ??
                                                          '',
                                                      size: 12.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                                    
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8.r),
                                        child: MyTextStyleTrajanPro(
                                          text: controller
                                                  .propertyListDistinctive[index]
                                                  .title ??
                                              '',
                                          size: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8.r),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svg/map.svg',
                                              width: 16.w,
                                              height: 16.h,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            MyTextStyleTrajanPro(
                                              text:
                                                  '${controller.propertyListDistinctive[index].city ?? ''} - ${controller.propertyListDistinctive[index].street ?? ''}',
                                              size: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8.r),
                                        child: MyTextStyleTrajanPro(
                                          text:
                                              '${controller.propertyListDistinctive[index].price} \$',
                                          size: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF1C274D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: controller.propertyListDistinctive.length),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                MyTextStyleTrajanPro(
                  text: 'احدث',
                  size: 16.sp,
                  color: const Color(0xFF1C274D),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 5.w,
                ),
                MyTextStyleTrajanPro(
                  text: 'العقارات',
                  size: 16.sp,
                  color: const Color.fromARGB(255, 99, 177, 172),
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                MyTextStyleTrajanPro(
                  text: 'الكل',
                  size: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? Column(
                      children: List.generate(2, (index) {
                        return SingleChildScrollView(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 4.h),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              height: 100.h,
                            ),
                          ),
                        );
                      }),
                    )
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              var property = controller.propertyList[index];
                              Get.toNamed(AppRouting.detailsView,
                                  arguments: property);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 1,
                                      spreadRadius: 0.5,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    width: 120.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      image: DecorationImage(
                                        image: NetworkImage(controller
                                                .propertyList[index]
                                                .images?[0] ??
                                            ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(8.r),
                                              padding: EdgeInsets.all(2.r),
                                              width: 60.w,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 99, 177, 172),
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              child: Center(
                                                child: MyTextStyleTrajanPro(
                                                  text: controller
                                                          .propertyList[index]
                                                          .typesOwnership ??
                                                      '',
                                                  size: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MyTextStyleTrajanPro(
                                          text: controller
                                                  .propertyList[index].title ??
                                              '',
                                          size: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svg/map.svg',
                                              width: 16.w,
                                              height: 16.h,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            MyTextStyleTrajanPro(
                                              text:
                                                  '${controller.propertyList[index].city} - ${controller.propertyList[index].street}',
                                              size: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            MyTextStyleTrajanPro(
                                              text:
                                                  '${controller.propertyList[index].price} \$',
                                              size: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF1C274D),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 4.h,
                          ),
                      itemCount: controller.propertyList.length),
            ),
          ],
        ),
      ),
    );
  }
}
