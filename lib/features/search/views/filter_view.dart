import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/public_widgets/drop_down_button_provider.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/search/controllers/filter_search_controller.dart';
import 'package:waseet_app/features/search/widgets/filter_list.dart';
//import 'package:showcaseview/showcaseview.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  var filterSearchController = Get.put(FilterSearchController());

  String? propertyName;
  String? cityName;
  String? blockName;
  String? rentalName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: const SizedBox(),
          title: MyTextStyleTajwal(
            text: 'فلترة',
            size: 14.sp,
            color: const Color(0xFF1C274D),
            fontWeight: FontWeight.bold,
          ),
          actions: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                  onPressed: () => Get.offAllNamed(AppRouting.bottomNavigationBarView),
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF1C274D))),
            ),
          ]),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async{
                  if(validateFields()){
                  await filterSearchController.applyFilters();
                  Get.toNamed(AppRouting.searchView);
                  }
                },
                child: Obx(() => Container(
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
                  child: filterSearchController.isLoading.isTrue
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.grayBorder,
                              color: AppColors.white,
                            ),
                          )
                        :  Center(
                      child: MyTextStyleTajwal(
                          text: 'بحث',
                          size: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold)),
                ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: ListView(
          controller: filterSearchController.scrollController,
          children: [
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 8.h,
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextStyleTrajanPro(
                        text: 'أنواع الملكية',
                        size: 16.sp,
                        color: const Color(0xFF1C274D),
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      DropDownButtonProvider(
                          items: rental
                              .map((e) => e.filterText.toString())
                              .toList(),
                          selectedValue: rentalName,
                          selectItem: 'اختر نوع العقار',
                          iconData: const Icon(
                            LineIcons.arrowDown,
                            color: Color(0xFF169BD7),
                          ),
                          onchanged: (item) {
                            setState(() {
                              rentalName = item;
                              filterSearchController.changeRental(rentalName!);
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextStyleTrajanPro(
                      text: 'أنواع العقار',
                      size: 16.sp,
                      color: const Color(0xFF1C274D),
                      fontWeight: FontWeight.w500,
                    ),
                    DropDownButtonProvider(
                        items: property
                            .map((e) => e.filterText.toString())
                            .toList(),
                        selectedValue: propertyName,
                        selectItem: 'اختر العقار',
                        iconData: const Icon(
                          LineIcons.arrowDown,
                          color: Color(0xFF169BD7),
                        ),
                        onchanged: (item) {
                          setState(() {
                            propertyName = item!;
                            filterSearchController.changeAqar(propertyName!);
                          });

                          // controller.year.value = item!;
                          // log(item);
                        }),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextStyleTrajanPro(
                      text: 'المدينة',
                      size: 16.sp,
                      color: const Color(0xFF1C274D),
                      fontWeight: FontWeight.w500,
                    ),
                    Obx(
                      () => DropDownButtonProvider(
                          items: filterSearchController.cityLists
                              .map((e) => e.toString())
                              .toList(),
                          selectedValue: cityName,
                          selectItem: 'اختر المدينة',
                          iconData: const Icon(
                            LineIcons.arrowDown,
                            color: Color(0xFF169BD7),
                          ),
                          onchanged: (item) {
                            setState(() {
                              cityName = item;
                              filterSearchController.changeCity(cityName!);
                            });
                            // log(item);
                          }),
                    ),
                  ],
                )),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextStyleTrajanPro(
                      text: 'الحى',
                      size: 16.sp,
                      color: const Color(0xFF1C274D),
                      fontWeight: FontWeight.w500,
                    ),
                    Obx(
                      () => DropDownButtonProvider(
                          items: filterSearchController.streetLists
                              .map((e) => e.toString())
                              .toList(),
                          selectedValue: blockName,
                          selectItem: 'اختر الحى',
                          iconData: const Icon(
                            LineIcons.arrowDown,
                            color: Color(0xFF169BD7),
                          ),
                          onchanged: (item) {
                            setState(() {
                              blockName = item;
                              filterSearchController.changeBlock(blockName!);
                            });
                            // log(item);
                          }),
                    ),
                  ],
                )),
              ],
            ),

            SizedBox(
              height: 15.h,
            ),

            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextStyleTrajanPro(
                        text: 'السعر بالدولار',
                        size: 16.sp,
                        color: const Color(0xFF1C274D),
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
              height: 8.h,
            ),
                      Padding(
  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
  child: TextFormField(
    autofillHints: const [AutofillHints.telephoneNumber],
    cursorColor: Colors.yellow,
    onChanged: (value) {
      filterSearchController.changeMinPrice(int.parse(value));
    },
    decoration: InputDecoration(
      hintText: 'الحد الادنى',
      fillColor: const Color(0xFFF9F9FA),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Circular border
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Circular border on focus
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // General circular border
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(10), // Limit to 10 digits
      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
    ],
  ),
),
                      SizedBox(
                  height: 8.w,
                ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextFormField(
                          autofillHints: const [AutofillHints.telephoneNumber],
                          // controller: controller.phoneNumbertextEditingController,
                          cursorColor: Colors.yellow,
                          onChanged: (value) {
                            filterSearchController.changeMaxPrice(int.parse(value));
                          },
                          // focusNode: controller.focusNode,
                          decoration: InputDecoration(
      hintText: 'الحد الاقصى',
      fillColor: const Color(0xFFF9F9FA),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Circular border
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Circular border on focus
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // General circular border
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
    ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                10), // هنا تحديد الحد الأقصى للأرقام
                            FilteringTextInputFormatter
                                .digitsOnly, // التأكد من أنه يمكن إدخال أرقام فقط
                          ],
                        ),
                      ),
                    ],
                  ),
                
                ),
              ])
                  ]
                    )
                )
              ]
            )
          ]
        )
      ) 
    );
  }
  bool validateFields() {
  if (rentalName == null ||
      propertyName == null ||
      cityName == null ||
      blockName == null ||
      filterSearchController.minPrice.value == 0||
      filterSearchController.maxPrice.value == 0) {
    Get.snackbar(
      'تنبيه',
      'يرجى تعبئة جميع الحقول المطلوبة',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.warning, color: Colors.white),
    );
    return false;
  } if(filterSearchController.minPrice.value > filterSearchController.maxPrice.value) {
    Get.snackbar(
      'خطأ',
      'لا يمكن أن يكون الحد الأدنى أكبر من الحد الأقصى',
    );
    return false;
  }
  return true;
}

}