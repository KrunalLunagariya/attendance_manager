class UserModel {
  String? statusCode;
  String? message;
  Data? data;

  UserModel({this.statusCode, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? gender;
  String? companyName;
  String? branchId;
  String? departmentId;
  String? employeeShiftId;
  String? workType;
  String? userType;
  String? salary;
  String? joiningDate;
  String? status;
  String? address;
  String? cityId;
  String? stateId;
  String? countryId;
  int? roleId;
  String? profilePic;
  String? forgetPasswordKey;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? profilePicFullPath;
  String? accessToken;

  Data(
      {this.id,
        this.userName,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.gender,
        this.companyName,
        this.branchId,
        this.departmentId,
        this.employeeShiftId,
        this.workType,
        this.userType,
        this.salary,
        this.joiningDate,
        this.status,
        this.address,
        this.cityId,
        this.stateId,
        this.countryId,
        this.roleId,
        this.profilePic,
        this.forgetPasswordKey,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.profilePicFullPath,
        this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    gender = json['gender'];
    companyName = json['companyName'];
    branchId = json['branchId'];
    departmentId = json['departmentId'];
    employeeShiftId = json['employeeShiftId'];
    workType = json['workType'];
    userType = json['userType'];
    salary = json['salary'];
    joiningDate = json['joiningDate'];
    status = json['status'];
    address = json['address'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    roleId = json['roleId'];
    profilePic = json['profilePic'];
    forgetPasswordKey = json['forgetPasswordKey'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profilePicFullPath = json['profilePicFullPath'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['gender'] = this.gender;
    data['companyName'] = this.companyName;
    data['branchId'] = this.branchId;
    data['departmentId'] = this.departmentId;
    data['employeeShiftId'] = this.employeeShiftId;
    data['workType'] = this.workType;
    data['userType'] = this.userType;
    data['salary'] = this.salary;
    data['joiningDate'] = this.joiningDate;
    data['status'] = this.status;
    data['address'] = this.address;
    data['cityId'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['roleId'] = this.roleId;
    data['profilePic'] = this.profilePic;
    data['forgetPasswordKey'] = this.forgetPasswordKey;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['profilePicFullPath'] = this.profilePicFullPath;
    data['accessToken'] = this.accessToken;
    return data;
  }
}

// ##### for sqflite database ###### //
// class UserModel{
//   String? user_name;
//   String? email;
//   String? password;
//
//
//   UserModel(this.user_name, this.email, this.password);
//
//   Map<String, dynamic> toMap(){
//     var map = <String, dynamic>{
//       'user_name':user_name,
//       'email':email,
//       'password':password
//
//     };
//     return map;
//   }
//
//   UserModel.fromMap(Map<String, dynamic> map){
//     user_name= map['user_name'];
//     email= map['email'];
//     password= map['password'];
//   }
// }