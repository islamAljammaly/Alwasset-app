import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waseet_app/features/home/property_modal.dart';
import 'package:waseet_app/features/search/controllers/list_search_controller.dart';

class SearchFilterController extends GetxController {
  late TextEditingController titleTextEditingController;
  late TextEditingController yearTextEditingController;
  RxList<PropertyModel> searchListData = <PropertyModel>[].obs;
  var listSearchController = Get.put(ListSearchController());
  late PageController pageController;
  RxInt currentPage = 0.obs;
  RxBool loading = false.obs;
  RxInt saveSearchId = 0.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    pageController = PageController();

    titleTextEditingController = TextEditingController();
    yearTextEditingController = TextEditingController();
    super.onInit();
  }

  // قائمة لتخزين العقارات

  // حالة التحميل

  // استرجاع البيانات بناءً على userId مع معايير الفلترة
  Future<void> getPropertiesSearch({
    String? city,
    double? minPrice,
    double? maxPrice,
    double? minArea,
    double? maxArea,
  }) async {
    loading.value = true;

    try {
      log('111');
      Query query = _firestore.collection('requests');

      // إضافة فلاتر بناءً على المعايير المدخلة
      if (city != null && city.isNotEmpty) {
        query = query.where('city', isEqualTo: city);
      }
      if (minPrice != null) {
        query = query.where('price', isGreaterThanOrEqualTo: minPrice);
      }
      if (maxPrice != null) {
        query = query.where('price', isLessThanOrEqualTo: maxPrice);
      }
      if (minArea != null) {
        query = query.where('area', isGreaterThanOrEqualTo: minArea);
      }
      if (maxArea != null) {
        query = query.where('area', isLessThanOrEqualTo: maxArea);
      }

      // استعلام Firestore مع الفلاتر
      QuerySnapshot querySnapshot = await query.get();
      log('22 :: $querySnapshot');

      loading.value = false;

      // تحويل البيانات إلى قائمة من PropertyModel وتخزينها
      searchListData.value = querySnapshot.docs.map((doc) {
        return PropertyModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      log('33 Data fetched successfully: ${searchListData.length} items');
      print("Data fetched successfully: ${searchListData.length} items");
    } catch (e) {
      loading.value = false;
      print("Error fetching properties: $e");
    }
  }

  @override
  void dispose() {
    getPropertiesSearch();
    titleTextEditingController.dispose();
    yearTextEditingController.dispose();
    listSearchController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
