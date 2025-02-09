import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';

class LoginController extends GetxController {
  RxBool lodding = false.obs;
  RxBool secourText = false.obs;
  FocusNode focusNode = FocusNode();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formSignInKey = GlobalKey<FormState>();
  late TextEditingController phoneNumbertextEditingController;
  late TextEditingController passwordtextEditingController;

  @override
  void onInit() {
    phoneNumbertextEditingController =
        TextEditingController(text: Get.parameters['phoneNumber']);
    passwordtextEditingController = TextEditingController();

    super.onInit();
  }

  Future<void> signInWithPhoneAndPassword(String phone, String password) async {
    lodding.value = true;

    try {
      // البحث عن المستخدم برقم الهاتف
      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .get();

      // التحقق من وجود مستخدم
      if (result.docs.isEmpty) {
        lodding.value = false;
        Get.snackbar("Error", "This phone number is not registered.");
        return;
      }

      // استخراج بيانات المستخدم
      final userData = result.docs.first.data() as Map<String, dynamic>;

      // التحقق من كلمة المرور
      if (userData['password'] == password) {
        lodding.value = false;

        // تسجيل الدخول بنجاح
        Get.snackbar("Success", "Logged in successfully!");
        Get.offAllNamed(AppRouting
            .bottomNavigationBarView); // تحويل المستخدم إلى الصفحة الرئيسية
        LocalStorage().writeValue(Constants.token, result.docs.first.id);
      } else {
        lodding.value = false;

        // كلمة المرور غير صحيحة
        Get.snackbar("Error", "Incorrect password. Please try again.");
      }
    } catch (e) {
      lodding.value = false;

      // التعامل مع الأخطاء
      print("Error during sign in: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  @override
  void dispose() {
    phoneNumbertextEditingController.dispose();
    passwordtextEditingController.dispose();
    phoneNumbertextEditingController.clear();
    passwordtextEditingController.clear();
    super.dispose();
  }
}
