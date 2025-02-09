
class GetSaveSearchModel {
  int? statusCode;
  String? message;
  String? status;
  List<Data>? data;

  GetSaveSearchModel({this.statusCode, this.message, this.status, this.data});

  GetSaveSearchModel.fromJson(Map<String, dynamic> json) {
    if(json["status_Code"] is int) {
      statusCode = json["status_Code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["Data"] is List) {
      data = json["Data"] == null ? null : (json["Data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_Code"] = statusCode;
    _data["message"] = message;
    _data["status"] = status;
    if(data != null) {
      _data["Data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? sDate;
  String? sTitle;
  int? sId;

  Data({this.sDate, this.sTitle, this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["s_date"] is String) {
      sDate = json["s_date"];
    }
    if(json["s_title"] is String) {
      sTitle = json["s_title"];
    }
    if(json["s_id"] is int) {
      sId = json["s_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["s_date"] = sDate;
    _data["s_title"] = sTitle;
    _data["s_id"] = sId;
    return _data;
  }
}