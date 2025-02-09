import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/features/add_property/list_property_controller.dart';
import 'package:waseet_app/features/profile/profile_controller.dart';

class AddPropertyConfirmController extends GetxController {
  RxBool lodding = false.obs;
  final lPController = Get.put(ListPropertyController());
  final profileController = Get.put(ProfileController());

  void addPropertyExample() {
    lodding.value = true;
    Map<String, dynamic> propertyData = {
      'tittle': '${lPController.title}',
      'area': '${lPController.space}',
      'bathrooms': '${lPController.bathroom}',
      'bedrooms': '${lPController.bedroom}',
      'directions': '${lPController.side}',
      'city': '${lPController.city}',
      'distinctive': "1",
      'images': lPController.images,
      'notes': '${lPController.body}',
      'Aaddress': '${lPController.address}',
      'price': '${lPController.price}',
      'services': lPController.services,
      'street': '${lPController.block}',
      'typeprice': "شيكل",
      'typesownership': '${lPController.rental}',
      'typesproperty': '${lPController.aqar}',
      'year': '${lPController.year}',
      'userid': LocalStorage().readValue(Constants.token),
      'user': {
        'userName': profileController.userData.value?['userName'] ?? '',
        'phone': profileController.userData.value?['phone'] ?? '',
      },
      'createdAt': DateTime.now(),
    };
    addProperty(propertyData);
    Get.offAllNamed(AppRouting.bottomNavigationBarView);
  }

  Future<void> addProperty(Map<String, dynamic> propertyData) async {
    try {
      DocumentReference docRef = await FirebaseFirestore.instance.collection('requests').add(propertyData);
      await docRef.update({'id': docRef.id});
      Get.snackbar("Success", "Property added successfully!",
          snackPosition: SnackPosition.BOTTOM);
      lodding.value = false;
    } catch (e) {
      lodding.value = false;
      print("Error adding request: $e");
      Get.snackbar("Error", "Failed to add property. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
