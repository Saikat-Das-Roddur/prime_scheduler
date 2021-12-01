class RegistrationResponse{
  int? status;
  String? message;
  String? email;
  bool? isAdmin;

  RegistrationResponse({ this.status, this.message});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status_code'];
    message = json['message'];
    email = json['email'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status_code'] = status;
    data['message'] = message;
    data['email'] = email;
    data['is_admin'] = isAdmin;
    return data;
  }
}