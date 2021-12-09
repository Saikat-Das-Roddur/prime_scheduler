import 'employee_response.dart';

class Employees {
  List<Employee>? employee;
  int? statusCode;

  Employees({this.employee, this.statusCode});

  Employees.fromJson(Map<String, dynamic> json) {
    if (json['employee'] != null) {
      employee =  <Employee>[];
      json['employee'].forEach((v) {
        employee?.add(Employee.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employee != null) {
      data['employee'] = employee?.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

