import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/routing.dart';

class SignInController extends GetxController {
  RxBool lodding = false.obs;
  RxBool secourText = false.obs;
  FocusNode focusNode = FocusNode();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var verificationId = ''.obs;
  final formSignInKey = GlobalKey<FormState>();
  late TextEditingController phoneNumbertextEditingController;

  @override
  void onInit() {
    phoneNumbertextEditingController = TextEditingController();
    super.onInit();
  }

  Future<void> checkPhoneNumberAndNavigate() async {
  lodding.value = true;

  try {
  print('Phone Number: ${phoneNumbertextEditingController.text}');
  print('Form State: ${formSignInKey.currentState}');

  final QuerySnapshot result = await _firestore
      .collection('users')
      .where('phone', isEqualTo: phoneNumbertextEditingController.text)
      .get();

  print('Query Result: ${result.docs}');
  
  if (result.docs.isNotEmpty) {
    lodding.value = false;
    Get.snackbar('Success', 'الرقم مسجل بالفعل');
    Get.toNamed(AppRouting.loginView);
  } else {
    lodding.value = false;
    Get.snackbar('Info', 'الرقم غير مسجل، سيتم تحويلك للتسجيل');
    Get.toNamed(AppRouting.signUpView, parameters: {'phoneNumber': phoneNumbertextEditingController.text});
  }
} catch (e, stackTrace) {
  lodding.value = false;
  print("Error checking phone number: $e");
  print("Stack Trace: $stackTrace");
  Get.snackbar("Error", "حدث خطأ أثناء التحقق من الرقم");
}

}



  @override
  void dispose() {
    phoneNumbertextEditingController.dispose();
    phoneNumbertextEditingController.clear();
    super.dispose();
  }
}
