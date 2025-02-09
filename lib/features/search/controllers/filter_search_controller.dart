import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/features/home/property_modal.dart';

class FilterSearchController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PropertyModel> searchResults = <PropertyModel>[].obs;

  // Filters
  var title = ''.obs;
  var rentalType = ''.obs;
  var propertyType = ''.obs;
  var city = ''.obs;
  var block = ''.obs;
  var direction = ''.obs;
  var ownerType = ''.obs;
  var minPrice = 0.obs;
  var maxPrice = 0.obs;
  var minArea = 0.obs;
  var maxArea = 0.obs;
  var bedrooms = 0.obs;
  var bathrooms = 0.obs;
  var currency = ''.obs;
  var scrollController = ScrollController();
  List<RxString> cityLists = ['غزة'.obs,'خانيونس'.obs,'الوسطى'.obs,'رفح'.obs];
  List<RxString> streetLists = ['النصر'.obs,'تل الهوا'.obs,'الشجاعية'.obs,'بيت حانون'.obs,'جباليا'.obs,'شارع البحر'.obs,'السودانية'.obs, 'الجلاء'.obs, 'الوحدة'.obs, 'صلاح الدين'.obs,'الشاطئ'.obs,'الصبرة'.obs,'مواصي خانيونس'.obs,'دوار البركة'.obs];

  // Services filters
  var statusServiceFilter = false.obs;
  var paymentServiceFilter = false.obs;
  var furnitureFilter = false.obs;
  var elevatorFilter = false.obs;
  var serviceFilter = false.obs;
  var parkingServiceFilter = false.obs;
  var powerServiceFilter = false.obs;
  var guardServiceFilter = false.obs;
  var lvReadyServiceFilter = false.obs;

  // Apply filters and fetch results from Firestore
  Future<void> applyFilters() async {
    print(rentalType.value);
    print(propertyType.value);
    isLoading.value = true;

    try {
      Query query = FirebaseFirestore.instance.collection('requests');
      if (rentalType.isNotEmpty && propertyType.isNotEmpty && city.value.isNotEmpty && block.value.isNotEmpty && minPrice.value != 0) {
        query = query.where('typesownership', isEqualTo: rentalType.value)
        .where('typesproperty', isEqualTo: propertyType.value)
        .where('city', isEqualTo: city.value)
        .where('street', isEqualTo: block.value)
        .where('price', isGreaterThanOrEqualTo: minPrice.value.toString())
        .where('price', isLessThanOrEqualTo: maxPrice.value.toString())
        .orderBy('price');
      }
     
      // Fetch filtered data
    QuerySnapshot querySnapshot = await query.get();
searchResults.value = querySnapshot.docs.map((doc) {
  return PropertyModel.fromMap(doc.data() as Map<String, dynamic>);
}).toList();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to fetch search results. Try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Change functions for filters
  void changeTitle(String newTitle) => title.value = newTitle;
  void changeRental(String rental) => rentalType.value = rental;
  void changeAqar(String property) => propertyType.value = property;
  void changeCity(String cityName) => city.value = cityName;
  void changeBlock(String blockName) => block.value = blockName;
  void changeSide(String side) => direction.value = side;
  void changeOwner(String owner) => ownerType.value = owner;
  void changeMinPrice(int price) => minPrice.value = price;
  void changeMaxPrice(int price) => maxPrice.value = price;
  void changeMinArea(int area) => minArea.value = area;
  void changeMaxArea(int area) => maxArea.value = area;
  void changeBathroom(int count) => bathrooms.value = count;
  void changeBedroom(int count) => bedrooms.value = count;
  void changeCurrency(String curr) => currency.value = curr;
  
  // Service filters

}