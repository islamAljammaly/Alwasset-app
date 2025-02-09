import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/search/controllers/filter_search_controller.dart';


class SearchView extends GetView<FilterSearchController> {
  final FilterSearchController listSearchController = Get.find();

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتائج البحث'),
      ),
      body: Obx(() {
        if (listSearchController.isLoading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF1C274D),
            ),
          );
        }
        if (listSearchController.searchResults.isEmpty) {
          return const Center(child: Text('لا توجد نتائج.'));
        }
        return ListView.builder(
          itemCount: listSearchController.searchResults.length,
          itemBuilder: (context, index) {
            var property = listSearchController.searchResults[index];
            return InkWell(
              onTap: () {
                var property =controller.searchResults[index];
                Get.toNamed(AppRouting.detailsView,
                arguments: property);
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            image: NetworkImage(property.images![0]),
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
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Center(
                                    child: MyTextStyleTrajanPro(
                                      text: property.typesOwnership ?? '',
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
                        padding: EdgeInsets.all(3.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTextStyleTrajanPro(
                              text: property.title ?? '',
                              size: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                            MyTextStyleTrajanPro(
                              text: '${property.price} \$',
                              size: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C274D),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.r),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/map.svg',
                              width: 16.w,
                              height: 16.h,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8.w),
                            MyTextStyleTrajanPro(
                              text:
                                  '${property.city ?? ''} - ${property.street ?? ''}',
                              size: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
