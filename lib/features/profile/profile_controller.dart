import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/local_storage.dart';

class ProfileController extends GetxController {
  late TextEditingController fullNameTextEditingController;
  late TextEditingController addressTextEditingController;
  RxBool loddingUpdate = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxString year = ''.obs;
  RxString cityName = ''.obs;
  RxInt cityId = 0.obs;
  RxString blockName = ''.obs;
  RxInt blockId = 0.obs;

  RxBool showInfo = false.obs;
  final Rx<Map<String, dynamic>?> userData = Rx<Map<String, dynamic>?>(null);

  /// Fetch user data from Firestore
  Future<void> fetchUserData() async {
    try {
      String? userId = LocalStorage().readValue(Constants.token);

      if (userId != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userId).get();

        if (userDoc.exists) {
          userData.value = userDoc.data() as Map<String, dynamic>?;
          // Update the TextEditingControllers with fetched data
          fullNameTextEditingController.text =
              userData.value?['userName'] ?? '';
          addressTextEditingController.text = userData.value?['address'] ?? '';
          cityName.value = userData.value?['city'] ?? '';
          blockName.value = userData.value?['street'] ?? '';
        } else {
          Get.snackbar("Error", "User not found.");
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
      Get.snackbar("Error", "Failed to fetch user data.");
    }
  }

  /// Update user data in Firestore
  Future<void> updateUserData() async {
    loddingUpdate.value = true;
    try {
      String? userId = LocalStorage().readValue(Constants.token);
      if (userId == null) {
        loddingUpdate.value = false;
        Get.snackbar("Error", "User not logged in.");
        return;
      }

      await _firestore.collection('users').doc(userId).update({
        'userName': fullNameTextEditingController.text,
        'phone': userData.value!['phone'],
        'city': cityName.value,
        'street': blockName.value,
        'address': addressTextEditingController.text,
        'updatedAt': DateTime.now(),
      });

      // Update local userData with new values
      userData.value = {
        'userName': fullNameTextEditingController.text,
        'phone': userData.value!['phone'],
        'city': cityName.value,
        'street': blockName.value,
        'address': addressTextEditingController.text,
        'updatedAt': DateTime.now(),
      };

      Get.snackbar("Success", "User data updated successfully!");
      loddingUpdate.value = false;
    } catch (e) {
      loddingUpdate.value = false;
      print("Failed to update user data: $e");
      Get.snackbar("Error", "Failed to update user data.");
    } finally {
      loddingUpdate.value = false;
    }
  }

  /// Clear user data from memory
  void clearUserData() {
    userData.value = null;
    fullNameTextEditingController.clear();
    addressTextEditingController.clear();
    cityName.value = '';
    blockName.value = '';
  }

  @override
  void onInit() {
    fetchUserData();
    fullNameTextEditingController = TextEditingController();
    addressTextEditingController = TextEditingController();
    super.onInit();
  }
}
