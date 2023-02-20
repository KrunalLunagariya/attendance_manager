class UserModel {
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

  UserModel(
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

  UserModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['gender'] = gender;
    data['companyName'] = companyName;
    data['branchId'] = branchId;
    data['departmentId'] = departmentId;
    data['employeeShiftId'] = employeeShiftId;
    data['workType'] = workType;
    data['userType'] = userType;
    data['salary'] = salary;
    data['joiningDate'] = joiningDate;
    data['status'] = status;
    data['address'] = address;
    data['cityId'] = cityId;
    data['stateId'] = stateId;
    data['countryId'] = countryId;
    data['roleId'] = roleId;
    data['profilePic'] = profilePic;
    data['forgetPasswordKey'] = forgetPasswordKey;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profilePicFullPath'] = profilePicFullPath;
    data['accessToken'] = accessToken;
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