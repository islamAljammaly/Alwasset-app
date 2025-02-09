import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:waseet_app/features/home/property_modal.dart';

class ControllerHome extends GetxController {
  var propertyListDistinctive = <PropertyModel>[].obs;
  var propertyList =
      <PropertyModel>[].obs; // Observable list to store the properties
  var isLoadingDistinctive = true.obs;
  var isLoading = true.obs; // To track loading state

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    Future.wait([
      fetchPropertiesDistinctive(),
      fetchProperties(),
    ]);
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchPropertiesDistinctive() async {
    isLoadingDistinctive(true); // Start loading
    try {
      // Fetch all documents from 'requests' collection
      QuerySnapshot snapshot = await _firestore.collection('requests').get();

      // Filter data to include only properties where 'distinctive' equals 1
      var data = snapshot.docs
          .map((doc) =>
              PropertyModel.fromMap(doc.data() as Map<String, dynamic>))
          .where((property) =>
              property.distinctive == "1") // Filter for distinctive == 1
          .toList();
          for (var property in data) {
      print("Fetched image URL (Distinctive): ${property.images}");
    }
      isLoadingDistinctive(false);
      propertyListDistinctive.value =
          data;   // Update the observable list with the filtered data
    } catch (e) {
      print("Error fetching properties: $e");
      
    } finally {
      isLoadingDistinctive(false); // End loading
    }
  }

  Future<void> fetchProperties() async {
    isLoading(true);
    try {
      // Start loading
      QuerySnapshot snapshot = await _firestore.collection('requests').get();
      var data = snapshot.docs
          .map((doc) =>
              PropertyModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      isLoading(false);
      propertyList.value = data; // Update the observable list with the data
    } catch (e) {
      print("Error fetching properties: $e");
    } finally {
      isLoading(false); // End loading
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
