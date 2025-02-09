import 'dart:developer';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:waseet_app/core/constant/colors.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tajwal.dart';
import 'package:waseet_app/core/public_widgets/my_text_style_tranjan_pro.dart';
import 'package:waseet_app/features/add_property/add_property_confirm_controller.dart';
import 'package:waseet_app/features/add_property/add_property_view1.dart';
import 'package:waseet_app/features/add_property/list_property_controller.dart';
import 'package:waseet_app/features/search/widgets/filter_list.dart';

class AddPropertyView2 extends StatefulWidget {
  const AddPropertyView2({super.key});

  @override
  State<AddPropertyView2> createState() => _AddPropertyView2State();
}

class _AddPropertyView2State extends State<AddPropertyView2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int statusServiceFilterId = 0;
  int paymentServiceFilterId = 0;
  int furnitureFilterId = 0;
  int elevatorFilterId = 0;
  int serviceFilterId = 0;
  int parkingServiceFilterId = 0;
  int powerServiceFilterId = 0;
  int guardServiceFilterId = 0;
  int lvReadyServiceFilterId = 0;
  List<File> imagePaths = [];
  List<String> imageServer = [];
  File? image;
  XFile? _pickedFile;
  final _picker = ImagePicker();
  int year = DateTime.now().year;
  int minYear = 1950;

  String builtYear = DateTime.now().year.toString();
  int id = 0;
  bool error = false;
  TextEditingController price = TextEditingController();
  TextEditingController space = TextEditingController();
  TextEditingController years = TextEditingController();

  void getImageGallery(List<String> imagePath) async {
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (_pickedFile != null) {
      image = File(_pickedFile!.path);
      final compressedImage = await FlutterImageCompress.compressWithFile(
        image!.path,
        quality: 85,
      );

      final compressedImageFile = File(image!.path)
        ..writeAsBytesSync(compressedImage!);
      final compressedSize = compressedImageFile.lengthSync();
      log('حجم الصورة المضغوطة: ${(compressedSize / (1024 * 1024)).toStringAsFixed(2)} MB');
      imagePaths.add(compressedImageFile);
      uploadImageToCloudinary(compressedImageFile);
      setState(() {});
    }
  }

  Future<void> uploadImageToCloudinary(File imageFile) async {
    const String cloudName = 'dgmt6kxth';
    const String apiKey = '151284652895978';
    const String apiSecret = 'w_GktrtELeAVUBoPMXPIrj5Lpfk';
    final cloudinary = Cloudinary.signedConfig(
      apiKey: apiKey,
      apiSecret: apiSecret,
      cloudName: cloudName,
    );
    final response = await cloudinary.upload(
        file: imageFile.path,
        fileBytes: imageFile.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        folder: 'AlWaseetImage',
        fileName: 'Images',
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        });

    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
      final lpControllerImage = Get.put(ListPropertyController());
      lpControllerImage.images.add(response.secureUrl.toString());
      print('List Image Controller :: ${lpControllerImage.images}');
    }
  }

  selectedYear(value) {
    setState(() {
      builtYear = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lPController = Get.put(ListPropertyController());
    var addPropertyConfirmController = Get.put(AddPropertyConfirmController());

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
              onPressed: () => Get.back(),
              icon: const Icon(
                LineIcons.arrowLeft,
                color: Color(0xFF1C274D),
              )),
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: ListView(
            children: [
              MyTextStyleTrajanPro(
                text: 'خطوة 2 من 2',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                value: 2 / 2,
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
                          text: 'سنة البناء',
                          size: 16.sp,
                          color: const Color(0xFF1C274D),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF707070),
                          controller: years,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                4),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            int years = int.parse(value);
                            if (years < minYear || years > year) {
                              return 'السنة يجب أن تكون بين $minYear و \n$year';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'مثال : 1980',
                              suffixIcon: Container(
                                width: 70.w,
                                color: Colors.grey[200],
                                child: const Center(
                                    child: Text(
                                  'سنة',
                                  style: TextStyle(
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 15),
                              enabledBorder: border,
                              border: border,
                              focusedBorder: border,
                              disabledBorder: border),
                          keyboardType: TextInputType.number,
                        ),
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
                          text: 'مساحة العقار',
                          size: 16.sp,
                          color: const Color(0xFF1C274D),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF707070),
                          controller: space,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: 'ادخل المساحة',
                              suffixIcon: Container(
                                width: 70.w,
                                color: Colors.grey[200],
                                child: const Center(
                                    child: Text(
                                  'متر',
                                  style: TextStyle(
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 15),
                              enabledBorder: border,
                              border: border,
                              focusedBorder: border,
                              disabledBorder: border),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              MyTextStyleTrajanPro(
                text: 'خدمات',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),

              Row(
                children: [
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (statusServiceFilterId == 0) {
                                    statusServiceFilterId = 1;
                                    lPController.services
                                        .add(status[index].filterText);
                                    log('message add :: ${status[index].filterText}');
                                  } else {
                                    lPController.services
                                        .remove(status[index].filterText);
                                    log('message remove :: ${status[index].filterText}');
                                    statusServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: statusServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/myProperties.svg',
                                      color: statusServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: status[index].filterText,
                                      color: statusServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                      1,
                      (index) => Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (paymentServiceFilterId == 0) {
                                    paymentServiceFilterId = 1;
                                    lPController.services
                                        .add(paymentList[index].filterText);
                                  } else {
                                    lPController.services
                                        .remove(paymentList[index].filterText);
                                    paymentServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: paymentServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SvgPicture.asset(
                                        'assets/svg/money.svg',
                                        color: paymentServiceFilterId == 1
                                            ? AppColors.white
                                            : const Color(0xFF1C274D),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: paymentList[index].filterText,
                                      color: paymentServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (furnitureFilterId == 0) {
                                    furnitureFilterId = 1;
                                    lPController.services
                                        .add(furnitureFilter[index].filterText);
                                  } else {
                                    lPController.services.remove(
                                        furnitureFilter[index].filterText);
                                    furnitureFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: furnitureFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/furniture.svg',
                                      color: furnitureFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: furnitureFilter[index].filterText,
                                      color: furnitureFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),

              Row(
                children: [
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض' &&
                            lPController.aqarName.value != 'مخزن'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (elevatorFilterId == 0) {
                                    elevatorFilterId = 1;
                                    lPController.services
                                        .add(furnitureFilter[index].filterText);
                                  } else {
                                    lPController.services.remove(
                                        elevatorFilter[index].filterText);
                                    elevatorFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: elevatorFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/elevator.svg',
                                      width: 24.w,
                                      height: 23.h,
                                      color: elevatorFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: 'مصعد',
                                      color: elevatorFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض' &&
                            lPController.aqarName.value != 'مخزن'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (serviceFilterId == 0) {
                                    serviceFilterId = 1;
                                    lPController.services
                                        .add(serviceFilter[index].filterText);
                                  } else {
                                    lPController.services.remove(
                                        serviceFilter[index].filterText);
                                    serviceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: serviceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/services.svg',
                                      width: 24.w,
                                      height: 22.h,
                                      color: serviceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: 'خدمات',
                                      color: serviceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (parkingServiceFilterId == 0) {
                                    parkingServiceFilterId = 1;
                                    lPController.services
                                        .add(parkingList[index].filterText);
                                  } else {
                                    lPController.services
                                        .remove(parkingList[index].filterText);
                                    parkingServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: parkingServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/passenger.svg',
                                      width: 24.w,
                                      height: 26.h,
                                      color: parkingServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: 'موقف',
                                      color: parkingServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),

              SizedBox(
                height: 8.h,
              ),

              Row(
                children: [
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (powerServiceFilterId == 0) {
                                    powerServiceFilterId = 1;
                                    lPController.services
                                        .add(powerList[index].filterText);
                                  } else {
                                    lPController.services
                                        .remove(powerList[index].filterText);
                                    powerServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: powerServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/power.svg',
                                      width: 24.w,
                                      height: 23.h,
                                      color: powerServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: 'مولد',
                                      color: powerServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (guardServiceFilterId == 0) {
                                    guardServiceFilterId = 1;
                                    lPController.services
                                        .add(guardList[index].filterText);
                                  } else {
                                    lPController.services
                                        .remove(guardList[index].filterText);
                                    guardServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: guardServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/guard.svg',
                                      width: 24.w,
                                      height: 22.h,
                                      color: guardServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    MyTextStyleTrajanPro(
                                      text: 'حارس',
                                      color: guardServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  ...List.generate(
                    1,
                    (index) => lPController.aqarName.value != 'قطعة أرض'
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (lvReadyServiceFilterId == 0) {
                                    lvReadyServiceFilterId = 1;
                                    lPController.services
                                        .add(lvReadyList[index].filterText);
                                    log('services List :: ${lPController.services}');
                                  } else {
                                    lPController.services
                                        .remove(lvReadyList[index].filterText);
                                    log('services List :: ${lPController.services}');
                                    lvReadyServiceFilterId = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: lvReadyServiceFilterId == 1
                                      ? const Color(0xFF1C274D)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF1C274D)),
                                ),
                                child: Row(
                                  children: [
                                    MyTextStyleTrajanPro(
                                      text: lvReadyList[index].filterText,
                                      color: lvReadyServiceFilterId == 1
                                          ? AppColors.white
                                          : const Color(0xFF1C274D),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              // الصور
              MyTextStyleTrajanPro(
                text: 'صور العقار',
                size: 16.sp,
                color: const Color(0xFF1C274D),
                fontWeight: FontWeight.w500,
              ),

              ///
              SizedBox(
                height: 8.h,
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[200]!)),
                child: imagePaths.isEmpty
                    ? InkWell(
                        onTap: () async {
                          getImageGallery(lPController.images);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color(0xFF1C274D).withOpacity(0.2),
                              child: const Icon(
                                Icons.photo,
                                color: Color(0xFF1C274D),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            MyTextStyleTrajanPro(
                              text: 'حمل الصور هنا',
                              size: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextStyleTrajanPro(
                              text: 'حمل على الأقل صورة',
                              size: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1C274D),
                            ),
                          ],
                        )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Wrap(spacing: 5, runSpacing: 0, children: [
                            for (int i = 0; i < imagePaths.length; i++)
                              PhotoWidget(
                                path: imagePaths[i],
                                onDelete: () {
                                  if (i < imagePaths.length) {
                                    imagePaths.removeAt(i);
                                    }
                                    if (i < imageServer.length) {
                                      imageServer.removeAt(i);
                                      }
                                      setState(() {});
                                      },
                              ),
                            for (int i = 0; i < 11 - imagePaths.length; i++)
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 75,
                                        width: 85,
                                        child: DottedBorder(
                                          color: Colors.grey[200]!,
                                          radius: const Radius.circular(5),
                                          borderType: BorderType.RRect,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () async {
                                              getImageGallery(
                                                  lPController.images);
                                            },
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor: Colors.blue
                                                    .withOpacity(0.4),
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color: Colors.black12,
                                                  size: 18,
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ]),
                        ),
                      ),
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
                  if (formKey.currentState!.validate()) {
                    if (space.text.isEmpty ||
                        years.text.isEmpty ||
                        imagePaths.isEmpty) {
                      setState(() {
                        error = true;
                      });
                    } else {
                      setState(() {
                        error = false;
                      });

                      if (lPController.images.isNotEmpty) {
                        lPController.changeYear(int.parse(years.text));
                        lPController.changeSpace(int.parse(space.text));
                        lPController.changeUsed(statusServiceFilterId);
                        lPController.changePay(paymentServiceFilterId);
                        lPController.changeFurniture(furnitureFilterId);
                        lPController.changeLeft(elevatorFilterId);
                        lPController.changeService(serviceFilterId);
                        lPController.changePark(parkingServiceFilterId);
                        lPController.changePower(powerServiceFilterId);
                        lPController.changeGuard(guardServiceFilterId);
                        lPController.changeLvready(lvReadyServiceFilterId);

                        addPropertyConfirmController.addPropertyExample();
                      }
                    }
                  }
                },
                child: Obx(
                  () => Container(
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: lPController.images.isEmpty ? Colors.grey : null,
                      gradient: lPController.images.isEmpty
                          ? null
                          : LinearGradient(colors: [
                              const Color.fromARGB(117, 51, 67, 124)
                                  .withOpacity(0.5),
                              const Color(0xFF1C274D),
                            ]),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: addPropertyConfirmController.lodding.isTrue
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.grayBorder,
                              color: AppColors.white,
                            ),
                          )
                        : Center(
                            child: MyTextStyleTajwal(
                            text: 'ارسال',
                            size: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PhotoWidget extends StatelessWidget {
  File path;
  Function()? onDelete;
  PhotoWidget({required this.path, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 75.h,
              width: 85.w,
              child: DottedBorder(
                color: Colors.grey[200]!,
                radius: Radius.circular(5.r),
                borderType: BorderType.RRect,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.file(
                    path,
                    height: 75.h,
                    width: 85.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 3.0.h),
              child: GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Colors.red.withOpacity(0.3),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 15,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
