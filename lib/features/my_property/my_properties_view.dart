import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/my_property/widgets/loading_my_property.dart';
import 'package:waseet_app/features/my_property/my_properties_controller.dart';

class MyPropertiesView extends GetView<MyPropertiesController> {
  const MyPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    var myPropertiesController = Get.put(MyPropertiesController());
    myPropertiesController.onInit();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(right: 6.w),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/myProperties.svg',
              width: 32.w,
              height: 32.h,
            ),
          ),
        ),
        title: MyTextStyleTajwal(
          text: 'عقاراتي',
          size: 14.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1C274D),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: IconButton(
              onPressed: () {
              },
              icon: SvgPicture.asset(
                'assets/svg/notification.svg',
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ListView(
          children: [
            Obx(
              () => myPropertiesController.lodding.isTrue
                  ? Column(
                      children: List.generate(
                      10,
                      (index) => const LoddingMyProperty(),
                    ))
                  : myPropertiesController.myPropertiesData.isNotEmpty
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  var property =
                                      controller.myPropertiesData[index];
                                  Get.toNamed(AppRouting.detailsView,
                                      arguments: property);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:controller.myPropertiesData[index].images != null &&
                                       controller.myPropertiesData[index].images!.isNotEmpty
                                    ? NetworkImage(
                                        controller.myPropertiesData[index].images![0].toString(),
                                      )
                                    : const NetworkImage(
                                        'https://i0.wp.com/www.complexsql.com/wp-content/uploads/2017/12/No-data-found-banner.png?fit=761%2C347'),
                                
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        MyTextStyleTrajanPro(
                                          text: controller
                                              .myPropertiesData[index].title
                                              .toString(),
                                          size: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: "تأكيد الحذف",
                                              middleText:
                                                  "هل أنت متأكد من حذف هذا العقار؟",
                                              textConfirm: "نعم",
                                              textCancel: "لا",
                                              confirmTextColor: Colors.white,
                                              onConfirm: () async {
                                  var propertyId = controller.myPropertiesData[index].id;
                                
                                  if (propertyId != null && propertyId.isNotEmpty) {
                                    await myPropertiesController.deleteProperty(propertyId);
                                    Get.back();
                                  } else {
                                    Get.snackbar("خطأ", "معرف العقار غير موجود أو غير صالح.");
                                  }
                                },
                                              onCancel: () {},
                                            );
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(255, 3, 21, 47),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.myPropertiesData.length)
                      : Center(
                          child: Image.asset('assets/images/no_properties.png'),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
