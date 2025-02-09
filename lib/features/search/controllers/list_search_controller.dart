import 'package:get/get.dart';

class ListSearchController extends GetxController {
  var title = ''.obs;
  var aqar = 0.obs;
  var rental = 1.obs;
  var city = 0.obs;
  var block = 0.obs;
  var side = 0.obs;
  var currency = 0.obs;
  var price = 0.obs;
  var year = 0.obs;
  var space = 0.obs;
  var bathroom = 0.obs;
  var bedroom = 0.obs;
  var furniture = 0.obs;
  var pay = 0.obs;
  var used = 0.obs;
  var left = 0.obs;
  var service = 0.obs;
  var park = 0.obs;
  var guard = 0.obs;
  var lvready = 0.obs;
  var power = 0.obs;
  var owner = 0.obs;
  var body = ''.obs;
  var aqarName = ''.obs;
  var facebook = ''.obs;
  var whatsApp = ''.obs;
  var address = ''.obs;
  RxList<String> images = <String>[].obs;

  // Getters
  int get getAqar => aqar.value;
  int get getRental => rental.value;
  int get getCity => city.value;
  int get getBlock => block.value;
  int get getSide => side.value;
  int get getCurrency => currency.value;
  int get getPrice => price.value;
  int get getYear => year.value;
  int get getSpace => space.value;
  int get getBathroom => bathroom.value;
  int get getBedroom => bedroom.value;
  int get getFurniture => furniture.value;
  int get getPay => pay.value;
  int get getUsed => used.value;
  int get getLeft => left.value;
  int get getService => service.value;
  int get getPark => park.value;
  int get getGuard => guard.value;
  int get getLvready => lvready.value;
  int get getPower => power.value;
  int get getOwner => owner.value;
  String get getTitle => title.value;
  String get getBody => body.value;
  String get getAqarName => aqarName.value;
  String get getFaceBook => facebook.value;
  String get getWhatsApp => whatsApp.value;
  String get getAddress => address.value;
  List<String> get getImages => images.toList();
  

  // Setters

  void changeAqar(int val) {
    aqar.value = val;
    update();
  }

  void changeRental(int val) {
    rental.value = val;
    update();
  }

  void changeCity(int val) {
    city.value = val;
    update();
  }

  void changeBlock(int val) {
    block.value = val;
    update();
  }

  void changeCurrency(int val) {
    currency.value = val;
    update();
  }

  void changePrice(int val) {
    price.value = val;
    update();
  }

  void changeYear(int val) {
    year.value = val;
    update();
  }

  void changeSpace(int val) {
    space.value = val;
    update();
  }

  void changeBathroom(int val) {
    bathroom.value = val;
    update();
  }

  void changeBedroom(int val) {
    bedroom.value = val;
    update();
  }

  void changeFurniture(int val) {
    furniture.value = val;
    update();
  }

  void changeUsed(int val) {
    used.value = val;
    update();
  }

  void changePay(int val) {
    pay.value = val;
    update();
  }

  void changeLeft(int val) {
    left.value = val;
    update();
  }

  void changeService(int val) {
    service.value = val;
    update();
  }

  void changePark(int val) {
    park.value = val;
    update();
  }

  void changePower(int val) {
    power.value = val;
    update();
  }

  void changeGuard(int val) {
    guard.value = val;
    update();
  }

  void changeLvready(int val) {
    lvready.value = val;
    update();
  }

  void changeSide(int val) {
    side.value = val;
    update();
  }

  void changeOwner(int val) {
    owner.value = val;
    update();
  }

  void changeTitle(String val) {
    title.value = val;
    update();
  }

  void changeBody(String val) {
    body.value = val;
    update();
  }

  void changeAqarName(String val) {
    aqarName.value = val;
    update();
  }

  void changeFacebook(String val) {
    facebook.value = val;
    update();
  }

  void changeWhatsApp(String val) {
    whatsApp.value = val;
    update();
  }

  void changeAddress(String val) {
    address.value = val;
    update();
  }

  void changeImages(List<String> newImages) {
    images.assignAll(newImages);
    update();
  }


  //
  void resetValues() {
    aqar.value = 0;
    rental.value = 0;
    city.value = 0;
    block.value = 0;
    side.value = 0;
    currency.value = 0;
    price.value = 0;
    year.value = 0;
    space.value = 0;
    bathroom.value = 0;
    bedroom.value = 0;
    furniture.value = 0;
    pay.value = 0;
    used.value = 0;
    left.value = 0;
    service.value = 0;
    park.value = 0;
    guard.value = 0;
    lvready.value = 0;
    power.value = 0;
    owner.value = 0;
    body.value = '';
    aqarName.value = '';
    facebook.value = '';
    whatsApp.value = '';
    address.value = '';
    images.clear(); // لحذف جميع الصور
  }
}
