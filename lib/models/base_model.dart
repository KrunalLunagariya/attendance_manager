class BaseModel {
  String? message;
  bool? status;
  dynamic data;

  BaseModel({this.message, this.status, this.data});

  factory BaseModel.fromJson(Map<String, dynamic> json){
    return BaseModel(message: json["message"], status: json["statusCode"] == "000", data: json["data"]);
  }
}