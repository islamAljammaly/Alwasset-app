
import 'package:waseet_app/features/search/model/currency_model.dart';
import 'package:waseet_app/features/search/model/elevator_model.dart';
import 'package:waseet_app/features/search/model/entities_model.dart';
import 'package:waseet_app/features/search/model/furnished_model.dart';
import 'package:waseet_app/features/search/model/guard_model.dart';
import 'package:waseet_app/features/search/model/lv_ready_model.dart';
import 'package:waseet_app/features/search/model/parking_model.dart';
import 'package:waseet_app/features/search/model/payment_model.dart';
import 'package:waseet_app/features/search/model/power_model.dart';
import 'package:waseet_app/features/search/model/property.dart';
import 'package:waseet_app/features/search/model/property_types_model.dart';
import 'package:waseet_app/features/search/model/rental_model.dart';
import 'package:waseet_app/features/search/model/service_model.dart';
import 'package:waseet_app/features/search/model/status_model.dart';

List<RentalModel> rental = [
  RentalModel(
    filterId: 1,
    filterText: "إيجار",
    ctype: 8,
    ctypeName: "p_post_rental",
  ),
  RentalModel(
    filterId: 2,
    filterText: "تمليك",
    ctype: 8,
    ctypeName: "p_post_rental",
  ),
];

List<PropertyTypesModel> propertyTypes = [
  PropertyTypesModel(
      filterId: 1,
      filterText: "المالك مباشرة",
      ctype: 4,
      ctypeName: "p_post_owner"),
  PropertyTypesModel(
      filterId: 2, filterText: "سمسار", ctype: 4, ctypeName: "p_post_owner"),
  PropertyTypesModel(
      filterId: 3,
      filterText: "مكتب عقارات",
      ctype: 4,
      ctypeName: "p_post_owner"),
];

List<Property> property = [
  Property(filterId: 1, filterText: "شقة", ctype: 1, ctypeName: "p_post_aqar"),
  Property(filterId: 2, filterText: "بيت", ctype: 1, ctypeName: "p_post_aqar"),
  Property(
      filterId: 3, filterText: "عمارة", ctype: 1, ctypeName: "p_post_aqar"),
  Property(
      filterId: 4, filterText: "قطعة أرض", ctype: 1, ctypeName: "p_post_aqar"),
  Property(filterId: 5, filterText: "مخزن", ctype: 1, ctypeName: "p_post_aqar"),
  Property(filterId: 6, filterText: "مكتب", ctype: 1, ctypeName: "p_post_aqar"),
  Property(
      filterId: 7, filterText: "شاليه", ctype: 1, ctypeName: "p_post_aqar"),
];

List<FurnitureFilterModel> furnitureFilter = [
  FurnitureFilterModel(
      filterId: 1,
      filterText: "معفشة",
      ctype: 2,
      ctypeName: "p_post_furniture"),
  FurnitureFilterModel(
      filterId: 2,
      filterText: "فارغة",
      ctype: 2,
      ctypeName: "p_post_furniture"),
];

List<ElevatorFilterModel> elevatorFilter = [
  ElevatorFilterModel(
      filterId: 1, filterText: 'مصعد', ctype: 3, ctypeName: 'p_post_left'),
  ElevatorFilterModel(
      filterId: 2,
      filterText: 'لا يوجد مصعد',
      ctype: 3,
      ctypeName: 'p_post_left'),
];

List<ServiceFilterModel> serviceFilter = [
  ServiceFilterModel(
      filterId: 1, filterText: "خدمات", ctype: 6, ctypeName: "p_post_service"),
  ServiceFilterModel(
      filterId: 2,
      filterText: "لا يوجد خدمات",
      ctype: 6,
      ctypeName: "p_post_service"),
];

List<EntitiesModel> entities = [
  EntitiesModel(
    filterId: 1,
    filterText: "شمالي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 2,
    filterText: "جنوبي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 3,
    filterText: "شرقي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 4,
    filterText: "غربي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 5,
    filterText: "شمالي شرقي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 6,
    filterText: "شمالي غربي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 7,
    filterText: "جنوبي شرقي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 8,
    filterText: "جنوبي غربي",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 9,
    filterText: "أربع واجهات مفتوحة",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
  EntitiesModel(
    filterId: 10,
    filterText: "أربع واجهات مغلقة",
    ctype: 7,
    ctypeName: "p_post_side",
  ),
];
List<CurrencyModel> currency = [
  CurrencyModel(
    filterId: 1,
    filterText: 'دولار',
    ctype: 10,
    ctypeName: 'p_post_currency',
  ),
  CurrencyModel(
    filterId: 2,
    filterText: 'دينار',
    ctype: 10,
    ctypeName: 'p_post_currency',
  ),
  CurrencyModel(
    filterId: 3,
    filterText: 'شيكل',
    ctype: 10,
    ctypeName: 'p_post_currency',
  ),
];
List<StatusModel> status = [
  StatusModel(
    filterId: 1,
    filterText: "جديدة",
    ctype: 8,
    ctypeName: "p_post_used",
  ),
  StatusModel(
    filterId: 2,
    filterText: "مستعملة",
    ctype: 8,
    ctypeName: "p_post_used",
  ),
];

List<PaymentModel> paymentList = [
  PaymentModel(
    filterId: 1,
    filterText: "دفع نقدي",
    ctype: 11,
    ctypeName: "p_post_pay",
  ),
  PaymentModel(
    filterId: 2,
    filterText: "بالتقسيط",
    ctype: 11,
    ctypeName: "p_post_pay",
  ),
];
List<ParkingModel> parkingList = [
  ParkingModel(
    filterId: 1,
    filterText: "يوجد موقف سيارات خاص",
    ctype: 12,
    ctypeName: "p_post_park",
  ),
  ParkingModel(
    filterId: 2,
    filterText: "لا يوجد موقف سيارات",
    ctype: 12,
    ctypeName: "p_post_park",
  ),
];
List<PowerModel> powerList = [
  PowerModel(
    filterId: 1,
    filterText: "مولد",
    ctype: 13,
    ctypeName: "p_post_power",
  ),
  PowerModel(
    filterId: 2,
    filterText: "لا يوجد مولد خارجي",
    ctype: 13,
    ctypeName: "p_post_power",
  ),
];

List<GuardModel> guardList = [
  GuardModel(
    filterId: 1,
    filterText: "حارس",
    ctype: 14,
    ctypeName: "p_post_guard",
  ),
  GuardModel(
    filterId: 2,
    filterText: "لا يوجد حارس",
    ctype: 14,
    ctypeName: "p_post_guard",
  ),
];

List<LvReadyModel> lvReadyList = [
  LvReadyModel(
    filterId: 1,
    filterText: "جاهزة للتسليم",
    ctype: 15,
    ctypeName: "p_post_lvready",
  ),
  LvReadyModel(
    filterId: 2,
    filterText: "قيد الإنشاء",
    ctype: 15,
    ctypeName: "p_post_lvready",
  ),
];
