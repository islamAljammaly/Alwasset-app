import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  String? id; // إضافة معرف العقار (id)
  String? area;
  String? bathrooms;
  String? bedrooms;
  String? city;
  String? directions;
  String? distinctive;
  List<String>? images;
  String? notes;
  String? price;
  List<String?>? services;
  String? street;
  String? title;
  String? typePrice;
  String? typesOwnership;
  String? typesProperty;
  String? year;
  User? user; // إضافة حقل المستخدم (user)
  DateTime? createdAt; // إضافة الحقل createdAt

  PropertyModel({
    this.id,
    this.area,
    this.bathrooms,
    this.bedrooms,
    this.city,
    this.directions,
    this.distinctive,
    this.images,
    this.notes,
    this.price,
    this.services,
    this.street,
    this.title,
    this.typePrice,
    this.typesOwnership,
    this.typesProperty,
    this.year,
    this.user,
    this.createdAt,
  });

  // From Firestore map to PropertyModel
  factory PropertyModel.fromMap(Map<String, dynamic> map, {String? documentId}) {
    return PropertyModel(
      id: documentId ?? map['id'],
      area: map['area'],
      bathrooms: map['bathrooms'],
      bedrooms: map['bedrooms'],
      city: map['city'],
      directions: map['directions'],
      distinctive: map['distinctive'],
      images: map['images'] != null ? List<String>.from(map['images']) : [],
      notes: map['notes'],
      price: map['price'],
      services: map['services'] != null ? List<String>.from(map['services']) : [],
      street: map['street'],
      title: map['tittle'],
      typePrice: map['typeprice'],
      typesOwnership: map['typesownership'],
      typesProperty: map['typesproperty'],
      year: map['year'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,
    );
  }

  // Convert to Map (for saving data to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'area': area,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'city': city,
      'directions': directions,
      'distinctive': distinctive,
      'images': images,
      'notes': notes,
      'price': price,
      'services': services,
      'street': street,
      'tittle': title,
      'typeprice': typePrice,
      'typesownership': typesOwnership,
      'typesproperty': typesProperty,
      'year': year,
      'user': user?.toMap(),
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

// نموذج المستخدم (User)
class User {
  String? userName;
  String? phone;
  String? userId;

  User({this.userName, this.phone, this.userId});

  // تحويل من Map إلى نموذج User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'],
      phone: map['phone'],
      userId: map['userid'],
    );
  }

  // تحويل من نموذج User إلى Map
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phone': phone,
      'userid': userId,
    };
  }
}
