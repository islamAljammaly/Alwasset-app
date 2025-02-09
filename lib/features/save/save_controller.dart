import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:waseet_app/core/constant/constants.dart';
import 'package:waseet_app/core/local_storage.dart';
import 'package:waseet_app/features/home/property_modal.dart';
import 'package:waseet_app/features/profile/profile_controller.dart';

class SavePropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isSaved = false.obs;
  var loading = false.obs;
      String? userId = LocalStorage().readValue(Constants.token);
      RxList<PropertyModel> myPropertiesData = <PropertyModel>[].obs;
      final profileController = Get.put(ProfileController());
      

      @override
  void onInit() {
    fetchSaved();
    super.onInit();
  }

  // حفظ العقار في مجموعة "saved"
  Future<void> saveProperty(PropertyModel property) async {
  try {
    if (userId != null) {
      await _firestore.collection('saved').add({
        'userId': userId,
        'propertyId': property.id,
        'tittle': property.title,
        'price': property.price,
        'typePrice': property.typePrice,
        'images': property.images,
        'city': property.city,
        'street': property.street,
        'createdAt': DateTime.now(),
        'bathrooms': property.bathrooms,
        'bedrooms': property.bedrooms,
        'services' : property.services,
        'notes': property.notes,
        'year': property.year,
        'directions': property.directions,
        'area': property.area,
        'user': {
        'userName': profileController.userData.value?['userName'] ?? '',
        'phone': profileController.userData.value?['phone'] ?? '',
      },
      });
      await fetchSaved();
      checkIfSaved(property);

      Get.snackbar("نجاح", "تم حفظ العقار بنجاح");
    } else {
      Get.snackbar("خطأ", "يجب تسجيل الدخول لحفظ العقار");
    }
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ أثناء حفظ العقار");
  }
}

Future<void> toggleSaveProperty(PropertyModel property) async {
  await fetchSaved();
  checkIfSaved(property);

  try {
    if (userId != null) {
      if (isSaved.value) {
        // ✅ Find the document in Firestore by propertyId
        QuerySnapshot querySnapshot = await _firestore
            .collection('saved')
            .where('userId', isEqualTo: userId)
            .where('propertyId', isEqualTo: property.id)  // Correct filtering
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // ✅ Delete all matching documents
          for (var doc in querySnapshot.docs) {
            await _firestore.collection('saved').doc(doc.id).delete();
          }

          // ✅ Remove from local list
          myPropertiesData.removeWhere((prop) => prop.id == property.id);
          isSaved.value = false;

          Get.snackbar("تم الإزالة", "تم إزالة العقار من المفضلة");
        } else {
          Get.snackbar("خطأ", "لم يتم العثور على العقار لإزالته");
        }
      } else {
        // Save property if it's not saved
        await saveProperty(property);
      }
    } else {
      Get.snackbar("خطأ", "يجب تسجيل الدخول");
    }
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ أثناء تعديل الحالة");
  }
}




Future<void> fetchSaved() async {
  try {
    loading.value = true;

    QuerySnapshot querySnapshot = await _firestore
        .collection('saved')
        .where('userId', isEqualTo: userId)
        .get();

    myPropertiesData.value = querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;

      return PropertyModel(
        id: data['propertyId'],                      // Correct mapping
        area: data['area'],
        bathrooms: data['bathrooms'],
        bedrooms: data['bedrooms'],
        city: data['city'],
        directions: data['directions'],
        distinctive: data['distinctive'],
        images: List<String>.from(data['images'] ?? []),
        notes: data['notes'],
        price: data['price'],
        services: data['services'] != null
            ? List<String>.from(data['services'])
            : [],
        street: data['street'],
        title: data['tittle'],                        // Corrected from 'tittle'
        typePrice: data['typePrice'],
        typesOwnership: data['typesownership'],
        typesProperty: data['typesproperty'],
        year: data['year'],
        user: data['user'] != null
            ? User.fromMap(data['user'])
            : null,
        createdAt: data['createdAt'] != null
            ? (data['createdAt'] as Timestamp).toDate()
            : null,
      );
    }).toList();

    loading.value = false;

    print("Fetched saved properties: ${myPropertiesData.map((e) => e.id).toList()}");
  } catch (e) {
    loading.value = false;
    print("Error fetching saved properties: $e");
  }
}



  void checkIfSaved(PropertyModel property) {
  try {
    isSaved.value = myPropertiesData.any((savedProperty) {
      print("Comparing: ${savedProperty.id} with ${property.id}");
      return savedProperty.id == property.id;
    });

    print("Is property saved? ${isSaved.value}");
  } catch (e) {
    print("Error checking saved status: $e");
  }
}


}
