import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/features/home/property_modal.dart';

class MyPropertiesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<PropertyModel> myPropertiesData = <PropertyModel>[].obs;

  // المتغير للتحكم في حالة التحميل
  var lodding = false.obs;

  // استرجاع البيانات بناءً على userId
  Future<void> getPropertiesByUserId(String userId) async {
    lodding.value = true;
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('requests') // تأكد من أن اسم المجموعة هو 'requests'
          .where('userid', isEqualTo: userId) // استخدام userId في البحث
          .get();

      lodding.value = false;

      // تحويل البيانات إلى قائمة من PropertyModel وتخزينها
      myPropertiesData.value = querySnapshot.docs.map((doc) {
        return PropertyModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      // هنا سيتم تحديث قائمة myPropertiesData بعد استرجاع البيانات
      print("Data fetched successfully: ${myPropertiesData.length} items");
    } catch (e) {
      lodding.value = false;
      print("Error fetching properties: $e");
    }
  }

  // حذف العقار بناءً على ID
  Future<void> deleteProperty(String id) async {
  try {
    // 1️⃣ Delete from 'requests'
    await _firestore.collection('requests').doc(id).delete();
    myPropertiesData.removeWhere((property) => property.id == id);

    // 2️⃣ Delete all matching documents from 'saved'
    QuerySnapshot savedSnapshot = await _firestore
        .collection('saved')
        .where('propertyId', isEqualTo: id)
        .get();

    for (var doc in savedSnapshot.docs) {
      await _firestore.collection('saved').doc(doc.id).delete();
    }

    Get.snackbar("نجاح", "تم حذف العقار من الطلبات والمحفوظات بنجاح");
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ أثناء حذف العقار: $e");
  }
}


  @override
  void onInit() {
    getPropertiesByUserId(LocalStorage().readValue(Constants.token).toString());
    super.onInit();
  }
}