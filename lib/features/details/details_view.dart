import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/details/details_controller.dart';
import 'package:waseet_app/features/save/save_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: const SizedBox(),
        title: MyTextStyleTajwal(
          text: 'تفاصيل',
          size: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                    ))),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8.r),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: InkWell(
          onTap: () async {
            Uri uri = Uri(
                scheme: 'tel', path: '${controller.property.user?.phone}');
            if (!await launchUrl(uri)) {
              throw Exception('Could not launch $uri');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200.w,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.facebook,
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    MyTextStyleTrajanPro(
                      text: 'اتصال',
                      size: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200.h,
            child: PageView.builder(
              controller: controller.controller,
              itemCount: controller.property.images?.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: controller.property.images![index] != '1' ? NetworkImage(
                            controller.property.images?[index] ??
                                ''.toString()) : const AssetImage('assets/images/pic1.jpg'),
                        fit: BoxFit.cover),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller.controller, // PageController
              count: controller.property.images!.length,
              effect: ExpandingDotsEffect(
                  paintStyle: PaintingStyle.fill,
                  activeDotColor: AppColors.facebook,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  dotColor: AppColors.grayBorder),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          // names
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                MyTextStyleTrajanPro(
                  text: controller.property.title ?? '',
                  size: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                SizedBox(
            width: 15.h,
          ),
           Obx(() {
  final saveController = Get.put(SavePropertyController());

  // Check if the property is saved before building the widget
  saveController.checkIfSaved(controller.property);

  return InkWell(
    onTap: () async {
      await saveController.toggleSaveProperty(controller.property);
      saveController.checkIfSaved(controller.property);  // Check again after saving
    },
    child: saveController.isSaved.value ? 
    SvgPicture.asset(
      'assets/svg/save.svg',
      color: Colors.black,
    ) : SvgPicture.asset(
      'assets/svg/old_save.svg',
    )
  );
}),
                const Spacer(),
                MyTextStyleTrajanPro(
                  text:
                      '${controller.property.price} دولار',
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C274D),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          // location
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextStyleTrajanPro(
                  text: '${controller.property.city ?? ''} - ${controller.property.street ?? ''}',
                  size: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C274D),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SvgPicture.asset('assets/svg/map.svg'),
              ],
            ),
          ),

          // user
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 14.r,
                  child: const Center(
                      child: Icon(
                    LineIcons.userCircleAlt,
                    color: AppColors.white,
                  )),
                ),
                SizedBox(
                  width: 8.w,
                ),
                MyTextStyleTrajanPro(
                  text: controller.property.user?.userName ?? '',
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 30.r,
            indent: 30.r,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/shawer.svg',
                        color: AppColors.black,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: controller.property.bedrooms ?? '0',
                        size: 13.sp,
                        fontWeight: FontWeight.w500,

                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bedrooms.svg',
                        color: AppColors.black,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: controller.property.bathrooms ?? '0',
                        size: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/size.svg',
                        color: AppColors.black,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      MyTextStyleTrajanPro(
                        text: '${controller.property.area ?? '-'} متر',
                        size: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 30.r,
            indent: 30.r,
          ),
          // حول
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MyTextStyleTrajanPro(
              text: 'الوصف',
              size: 15.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.facebook,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MyTextStyleTajwal(
              text: controller.property.notes ?? '',
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              size: 12.sp,
            ),
          ),
          Divider(
            endIndent: 30.r,
            indent: 30.r,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MyTextStyleTrajanPro(
              text: 'الخدمات',
              size: 15.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.facebook,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),

          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: SizedBox(
              height: 35.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // for (int index = 0; index < 5; index++)
                  if (controller.property.services?.contains('معفشة') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/furniture.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'معفشة',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                  if (controller.property.services?.contains('مصعد') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/elevator.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'مصعد',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                  if (controller.property.services?.contains('خدمات') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/services.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'خدمات شهرية',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                  if (controller.property.services?.contains('حارس') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/guard.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'حارس',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                  if (controller.property.services?.contains('يوجد موقف سيارات خاص') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/passenger.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'موقف سيارات',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                  if (controller.property.services?.contains('مولد') ?? false)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF1C274D).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/power.svg',
                            width: 24.w,
                            height: 26.h,
                            color: const Color(0xFF1C274D),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const MyTextStyleTrajanPro(
                            text: 'مولد خارجي',
                            color: Color(0xFF1C274D),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          // خدمات
          Divider(
            endIndent: 30.r,
            indent: 30.r,
          ),
          // تفاصيل اوضح
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MyTextStyleTrajanPro(
              text: 'تفاصيل اوضح',
              size: 15.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.facebook,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('نوع'),
                    Spacer(),
                    Text('نتائج'),
                  ],
                ),
                const Divider(),
                // for (int index = 0; index < 3; index++)
                Row(children: [
                  const Text('نوع الملكية'),
                  const Spacer(),
                  Text(controller.property.typesOwnership ?? '-'),
                ]),
                Row(children: [
                  const Text('سنة البناء'),
                  const Spacer(),
                  Text(controller.property.year ?? '-'),
                ]),
                Row(children: [
                  const Text('الاتجاهات'),
                  const Spacer(),
                  Text(controller.property.directions ?? '-'),
                ]),
                 Row(children: [
                  const Text('الدفع'),
                  const Spacer(),
                  controller.property.services!.contains('دفع نقدي') ?
                  const Text('نقدي') : const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('-'),
                  )
                ]),

                Row(children: [
                  const Text('جاهز للتسليم'),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(controller.property.services!.contains("جاهزة للتسليم")
                        ? 'نعم'
                        : 'لا'),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pages(int index, String image) => List.generate(
        6,
        (index) => Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        ),
      );
}
