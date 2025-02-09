class SearchModel {
  int? statusCode;
  String? message;
  String? status;
  List<Data>? data;

  SearchModel({this.statusCode, this.message, this.status, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json["status_Code"] is int) {
      statusCode = json["status_Code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["Data"] is List) {
      data = json["Data"] == null
          ? null
          : (json["Data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_Code"] = statusCode;
    _data["message"] = message;
    _data["status"] = status;
    if (data != null) {
      _data["Data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? postId;
  int? cusNo;
  String? postDate;
  String? postTitle;
  String? postDescription;
  String? cityName;
  String? blockName;
  int? postCity;
  int? postBlock;
  String? postLocation;
  int? postAqar;
  int? postFurniture;
  int? postLeft;
  int? postOwner;
  int? postRental;
  int? postService;
  int? postSide;
  int? postUsed;
  dynamic postPrice;
  int? postSize;
  int? room;
  int? bathroom;
  int? balcony;
  int? guard;
  int? livingReady;
  int? park;
  int? expPower;
  int? solarPower;
  int? pay;
  int? currency;
  int? postYear;
  List<Images>? images;

  Data(
      {this.postId,
      this.cusNo,
      this.postDate,
      this.postTitle,
      this.postDescription,
      this.cityName,
      this.blockName,
      this.postCity,
      this.postBlock,
      this.postLocation,
      this.postAqar,
      this.postFurniture,
      this.postLeft,
      this.postOwner,
      this.postRental,
      this.postService,
      this.postSide,
      this.postUsed,
      this.postPrice,
      this.postSize,
      this.room,
      this.bathroom,
      this.balcony,
      this.guard,
      this.livingReady,
      this.park,
      this.expPower,
      this.solarPower,
      this.pay,
      this.currency,
      this.images,
      this.postYear});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["post_id"] is int) {
      postId = json["post_id"];
    }
    if (json["cus_no"] is int) {
      cusNo = json["cus_no"];
    }
    if (json["post_date"] is String) {
      postDate = json["post_date"];
    }
    if (json["post_title"] is String) {
      postTitle = json["post_title"];
    }
    if (json["post_description"] is String) {
      postDescription = json["post_description"];
    }
    if (json["city_name"] is String) {
      cityName = json["city_name"];
    }
    if (json["block_name"] is String) {
      blockName = json["block_name"];
    }
    if (json["post_city"] is int) {
      postCity = json["post_city"];
    }
    if (json["post_block"] is int) {
      postBlock = json["post_block"];
    }
    if (json["post_location"] is String) {
      postLocation = json["post_location"];
    }
    if (json["post_aqar"] is int) {
      postAqar = json["post_aqar"];
    }
    if (json["post_furniture"] is int) {
      postFurniture = json["post_furniture"];
    }
    if (json["post_left"] is int) {
      postLeft = json["post_left"];
    }
    if (json["post_owner"] is int) {
      postOwner = json["post_owner"];
    }
    if (json["post_rental"] is int) {
      postRental = json["post_rental"];
    }
    if (json["post_service"] is int) {
      postService = json["post_service"];
    }
    if (json["post_side"] is int) {
      postSide = json["post_side"];
    }
    if (json["post_used"] is int) {
      postUsed = json["post_used"];
    }

    postPrice = json["post_price"];

    if (json["post_size"] is int) {
      postSize = json["post_size"];
    }
    if (json["room"] is int) {
      room = json["room"];
    }
    if (json["bathroom"] is int) {
      bathroom = json["bathroom"];
    }
    if (json["balcony"] is int) {
      balcony = json["balcony"];
    }
    if (json["guard"] is int) {
      guard = json["guard"];
    }
    if (json["living_ready"] is int) {
      livingReady = json["living_ready"];
    }
    if (json["park"] is int) {
      park = json["park"];
    }
    if (json["exp_power"] is int) {
      expPower = json["exp_power"];
    }
    if (json["solar_power"] is int) {
      solarPower = json["solar_power"];
    }
    if (json["pay"] is int) {
      pay = json["pay"];
    }
    if (json["currency"] is int) {
      currency = json["currency"];
    }
    if (json["post_year"] is int) {
      postYear = json["post_year"];
    }
    if (json["images"] is List) {
      images = json["images"] == null
          ? null
          : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["post_id"] = postId;
    _data["cus_no"] = cusNo;
    _data["post_date"] = postDate;
    _data["post_title"] = postTitle;
    _data["post_description"] = postDescription;
    _data["city_name"] = cityName;
    _data["block_name"] = blockName;
    _data["post_city"] = postCity;
    _data["post_block"] = postBlock;
    _data["post_location"] = postLocation;
    _data["post_aqar"] = postAqar;
    _data["post_furniture"] = postFurniture;
    _data["post_left"] = postLeft;
    _data["post_owner"] = postOwner;
    _data["post_rental"] = postRental;
    _data["post_service"] = postService;
    _data["post_side"] = postSide;
    _data["post_used"] = postUsed;
    _data["post_price"] = postPrice;
    _data["post_size"] = postSize;
    _data["room"] = room;
    _data["bathroom"] = bathroom;
    _data["balcony"] = balcony;
    _data["guard"] = guard;
    _data["living_ready"] = livingReady;
    _data["park"] = park;
    _data["exp_power"] = expPower;
    _data["solar_power"] = solarPower;
    _data["pay"] = pay;
    _data["currency"] = currency;
    _data["post_year"] = postYear;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Images {
  String? postImg;

  Images({this.postImg});

  Images.fromJson(Map<String, dynamic> json) {
    if (json["post_img"] is String) {
      postImg = json["post_img"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["post_img"] = postImg;
    return _data;
  }
}
