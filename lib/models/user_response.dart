class UserResponse {
  User? user;

  UserResponse({this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? phone;
  String? location;
  String? category;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? email;
  String? password;
  String? isAdmin;
  String?  pinCode ;
  String?  employeeId ;
  String? createdAt;
  String? updatedAt;
  String? value;
  int? statusCode;
  String? workingSeconds;
  String? message;
  String? lineAdminId;
  String? rootAdminId;

  User(
      {this.id,
        this.name,
        this.phone,
        this.location,
        this.category,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.email,
        this.password,
        this.isAdmin,
        this.pinCode,
        this.employeeId,
        this.lineAdminId,
        this.rootAdminId,
        this.createdAt,
        this.updatedAt,
        this.value,
        this.statusCode,
        this.workingSeconds,
        this.message});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    location = json['location'];
    category = json['category'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['is_admin'];
    pinCode = json['pin_code'];
    employeeId = json['employee_id'];
    lineAdminId = json['line_admin_id'];
    rootAdminId = json['root_admin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    value = json['value'];
    statusCode = json['status_code'];
    workingSeconds = json['working_seconds'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['category'] = this.category;
    data['company_name'] = this.companyName;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['is_admin'] = this.isAdmin;
    data['pin_code'] = this.pinCode;
    data['employee_id'] = this.employeeId;
    data['line_admin_id'] = this.lineAdminId;
    data['root_admin_id'] = this.rootAdminId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['value'] = this.value;
    data['status_code'] = this.statusCode;
    data['working_seconds'] = this.workingSeconds;
    data['message'] = this.message;
    return data;
  }
}