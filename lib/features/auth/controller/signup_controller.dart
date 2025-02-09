import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';

class SignUpController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // متغيرات الحالة
  var isLoading = false.obs;
  RxBool secourText = false.obs;
  RxInt gender = 1.obs;
  RxString year = ''.obs;
  RxString cityName = ''.obs;
  RxString cityId = ''.obs;
  RxString streetName = ''.obs;
  RxString streetId = ''.obs;
  
  final formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  late TextEditingController nameTextEditingController;
  late TextEditingController emailtextEditingController;
  late TextEditingController phonetextEditingController;
  late TextEditingController passowrdtextEditingController;
  late TextEditingController addressstextEditingController;

  @override
  void onInit() {
    nameTextEditingController = TextEditingController();
    emailtextEditingController = TextEditingController();
    phonetextEditingController = TextEditingController();
    passowrdtextEditingController = TextEditingController();
    addressstextEditingController = TextEditingController();

    super.onInit();
  }

  Future<void> signup({
    required String phoneNumber,
    required String userName,
    required String password,
    required String city,
    required String street,
  }) async {
    try {
      isLoading.value = true;

      // حفظ بيانات المستخدم في Firestore
      final userDoc = await _firestore.collection('users').add({
        'phone': Get.parameters['phoneNumber'],
        'userName': userName,
        'password': password,
        'city': city,
        'street': street,
        'year': year.value,
        'createdAt': DateTime.now(),
      });

      isLoading.value = false;
      Get.snackbar("نجاح", "تم تسجيل المستخدم بنجاح!");
      Get.offAllNamed(
          AppRouting.bottomNavigationBarView); // الانتقال إلى الصفحة الرئيسية
      LocalStorage().writeValue(Constants.token, userDoc.id);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("خطأ", e.toString());
    }
  }

  @override
  void onClose() {
    nameTextEditingController.dispose();
    emailtextEditingController.dispose();
    phonetextEditingController.dispose();
    passowrdtextEditingController.dispose();
    addressstextEditingController.dispose();
    super.onClose();
  }
}