import 'package:get/get.dart';

class ListPropertyController extends GetxController {
  var aqar = ''.obs;
  var rental = ''.obs;
  var city = ''.obs;
  var block = ''.obs;
  var side = ''.obs;
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
  var title = ''.obs;
  var body = ''.obs;
  var aqarName = ''.obs;
  var facebook = ''.obs;
  var whatsApp = ''.obs;
  var address = ''.obs;
  RxList<String> images = <String>[].obs;
  RxList<String> services = <String>[].obs;

  // Getters
  String get getAqar => aqar.value;
  String get getRental => rental.value;
  String get getCity => city.value;
  String get getBlock => block.value;
  String get getSide => side.value;
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
  List<String> get getServices => services.toList();

  // Setters

  void changeAqar(String val) {
    aqar.value = val;
    update();
  }

  void changeRental(String val) {
    rental.value = val;
    update();
  }

  void changeCity(String val) {
    city.value = val;
    update();
  }

  void changeBlock(String val) {
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

  void changeSide(String val) {
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

  void changeServce(List<String> newServce) {
    services.assignAll(newServce);
    update();
  }
}
