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
import 'package:waseet_app/features/add_property/list_property_controller.dart';
import 'package:waseet_app/features/search/widgets/filter_list.dart';

class AddPropertyView1 extends StatefulWidget {
  const AddPropertyView1({super.key});

  @override
  State<AddPropertyView1> createState() => _AddPropertyView1State();
}

class _AddPropertyView1State extends State<AddPropertyView1> {
  String? propertyName;
  String? cityName;
  String? blockName;
  String? entitiesSelect;
  String? currencySelect = 'شيكل';
  RxInt currencyId = 3.obs;
  int bathroom = 0;
  int bedroom = 0;
  int isPropertyTypes = 2;
  String? rentalName;
  bool error = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var cityBlocController = Get.put(GetCityBlocController());
    final lPController = Get.put(ListPropertyController());
    List<String?>? itemCity = ['غزة', 'خانيونس', 'رفح', 'الوسطى'];
    List<String?>? itemSreet = ['النصر','تل الهوا','الشجاعية','بيت حانون','جباليا','شارع البحر','السودانية', 'الجلاء', 'الوحدة', 'صلاح الدين','الشاطئ','الصبرة','مواصي خانيونس','دوار البركة'];
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        centerTitle: true,
        title: MyTextStyleTajwal(
          text: 'أضف عقار',
          size: 15.sp,
          color: const Color(0xFF1C274D),
          fontWeight: FontWeight.w700,
        ),
        actions: [
          IconButton(
              onPressed: () => Get.offAllNamed(AppRouting.bottomNavigationBarView),
              icon: const Icon(
                LineIcons.arrowLeft,
                color: Color(0xFF1C274D),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              MyTextStyleTrajanPro(
                text: 'خطوة 1 من 2',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                value: 1 / 2,
                valueColor: AlwaysStoppedAnimation(
                    const Color(0xFF1C274D).withOpacity(0.8)),
              ),
              SizedBox(
                height: 16.h,
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
                          height: 8.h,
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
                                lPController.changeRental(item!);
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
                        SizedBox(
                          height: 8.h,
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
                                propertyName = item;
          
                                lPController.changeAqar(item!);
                                propertyName = item;
                              });
                            }),
                      ],
                    ),
                  ),
                ],
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
                          text: 'المدينة',
                          size: 16.sp,
                          color: const Color(0xFF1C274D),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        DropDownButtonProvider(
                            items: itemCity.map((e) => e.toString()).toList(),
                            selectedValue: cityName,
                            selectItem: 'اختر المدينة',
                            iconData: const Icon(
                              LineIcons.arrowDown,
                              color: Color(0xFF169BD7),
                            ),
                            onchanged: (item) {
                              setState(() {
                                cityName = item;
                                blockName = null;
                                lPController.changeCity(item!);
                              });
          
                              // controller.cityId = city.cNo!;
                              // log(item);
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
                          text: 'الحي',
                          size: 16.sp,
                          color: const Color(0xFF1C274D),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        DropDownButtonProvider(
                            items: itemSreet.map((e) => e.toString()).toList(),
                            selectedValue: blockName,
                            selectItem: 'اختر الحى',
                            iconData: const Icon(
                              LineIcons.arrowDown,
                              color: Color(0xFF169BD7),
                            ),
                            onchanged: (item) {
                              setState(() {
                                blockName = item;
                                lPController.changeBlock(item!);
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              MyTextStyleTrajanPro(
                text: 'العنوان',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),
              TextFormField(
                controller: address,
                cursorColor: const Color(0xFF707070),
                decoration: InputDecoration(
                    hintText: 'مثال : غزة - النصر - شارع',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    disabledBorder: border),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if(value!.isEmpty || value.isNum || value.length > 100) {
                    return 'error';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  propertyName != 'مخزن'
                      ? Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextStyleTrajanPro(
                                text: 'الاتجاهات',
                                size: 16.sp,
                                color: const Color(0xFF1C274D),
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              DropDownButtonProvider(
                                  items: entities
                                      .map((e) => e.filterText.toString())
                                      .toList(),
                                  selectedValue: entitiesSelect,
                                  selectItem: 'اختر الاتجاهات',
                                  iconData: const Icon(
                                    LineIcons.arrowDown,
                                    color: Color(0xFF169BD7),
                                  ),
                                  onchanged: (item) {
                                    setState(() {
                                      entitiesSelect = item;
                                    });
          
                                    lPController.changeSide(item!);
                                  })
                            ],
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: propertyName != 'مخزن' ? 8.w : 0.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextStyleTrajanPro(
                          text: rentalName == 'إيجار'
                              ? 'مبلغ الايجار شهريا'
                              : 'سعر العقار',
                          size: 16.sp,
                          color: const Color(0xFF1C274D),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF707070),
                          controller: price,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: 'ادخل السعر',
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(3),
                                width: 70.w,
                                color: Colors.grey[200],
                                child: const Center(child: Text('دولار',style: TextStyle(fontSize: 16),))
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 15),
                              enabledBorder: border,
                              border: border,
                              focusedBorder: border,
                              disabledBorder: border),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value!.isEmpty || value.length > 10) {
                              return 'error';
                  }
                  return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              propertyName != 'قطعة أرض'
                  ? MyTextStyleTrajanPro(
                      text: 'تفاصيل الغرف',
                      size: 16.sp,
                      color: const Color(0xFF1C274D),
                      fontWeight: FontWeight.w500,
                    )
                  : const SizedBox(),
              SizedBox(
                height: propertyName != 'قطعة أرض' ? 8.h : 0.h,
              ),
              Row(
                children: [
                  propertyName != 'قطعة أرض'
                      ? Expanded(
                          child: Row(
                            children: [
                              MyTextStyleTrajanPro(
                                text: 'دورات المياة',
                                size: 14.sp,
                                color: const Color(0xFF1C274D),
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 25.h,
                                    width: 25.w,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        setState(() {
                                          if (bedroom == 0) {
                                            return;
                                          }
                                          bedroom--;
                                        });
                                      },
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(bedroom.toString()),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1C274D),
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 25.h,
                                    width: 25.w,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        setState(() {
                                          bedroom++;
                                        });
                                      },
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 30.h,
                    child: const VerticalDivider(
                      color: Color(0xFF1C274D),
                      thickness: 1,
                    ),
                  ),
                  propertyName != 'قطعة أرض' && propertyName != 'مخزن'
                      ? Expanded(
                          child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTextStyleTrajanPro(
                                text: 'غرف النوم',
                                size: 14.sp,
                                color: const Color(0xFF1C274D),
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 25.h,
                                    width: 25.w,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        setState(() {
                                          if (bathroom == 0) {
                                            return;
                                          }
                                          bathroom--;
                                        });
                                      },
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(bathroom.toString()),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1C274D),
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 25.h,
                                    width: 25.w,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        setState(() {
                                          bathroom++;
                                        });
                                      },
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              MyTextStyleTrajanPro(
                text: 'عنوان العقار',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: titleTextEditingController,
                maxLength: 30,
                cursorColor: const Color(0xFF707070),
                decoration: InputDecoration(
                    hintText: 'مثال شقة سكنية',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    disabledBorder: border),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16.h,
              ),
              MyTextStyleTrajanPro(
                text: 'تفاصيل العقار',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                cursorColor: const Color(0xFF707070),
                controller: bodyTextEditingController,
                maxLength: 400,
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: 'ادخل التفاصيل',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    disabledBorder: border),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'error';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: error
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(8.0),
                        color: const Color(0xFF9F271B)
                            .withOpacity(error ? 0.2 : 0.0),
                        height: error ? 40.0 : 0.0,
                        child: const Row(
                          children: [
                            Icon(Icons.warning, color: Color(0xFF9F271B)),
                            SizedBox(width: 8.0),
                            Text(
                              "الرجاء إكمال جميع البيانات المطلوبة **",
                              style: TextStyle(
                                color: Color(0xFF9F271B),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
  onTap: () {
    // Trigger the form validation
    if (formKey.currentState!.validate()) {
      // Check if dropdowns and other fields are filled
      if (propertyName == null ||
          cityName == null ||
          blockName == null ||
          rentalName == null ||
          entitiesSelect == null) {
        setState(() {
          error = true;  // Show error if dropdowns are empty
        });
        Get.snackbar("خطأ", "الرجاء إكمال جميع البيانات المطلوبة");
      } else {
        setState(() {
          error = false;  // No error, proceed
        });

        // Save the data to the controller
        lPController.changeAddress(address.text);
        lPController.changeTitle(titleTextEditingController.text);
        lPController.changeBody(bodyTextEditingController.text);
        lPController.changeAqarName(propertyName ?? '');
        lPController.changeOwner(isPropertyTypes);
        lPController.changePrice(int.parse(price.text));
        lPController.changeBathroom(bathroom);
        lPController.changeBedroom(bedroom);
        Get.toNamed(AppRouting.addPropertyView2);
      }
    } else {
      setState(() {
        error = true; 
      });
      Get.snackbar("خطأ", "الرجاء إدخال جميع البيانات بشكل صحيح");
    }
  },
  child: Container(
    height: 42.h,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        const Color.fromARGB(117, 51, 67, 124).withOpacity(0.5),
        const Color(0xFF1C274D),
      ]),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Center(
      child: MyTextStyleTajwal(
        text: 'التالي',
        size: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: BorderSide(
        color: const Color(0xFF707070).withOpacity(0.5), width: 0.5));
