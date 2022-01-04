import 'package:prime_scheduler/models/employee_response.dart';

class History {
  List<EmployeeHistory>? employeeHistory;
  int? statusCode;

  History({this.employeeHistory, this.statusCode});

  History.fromJson(Map<String, dynamic> json) {
    if (json['employee_history'] != null) {
      employeeHistory = <EmployeeHistory>[];
      json['employee_history'].forEach((v) {
        employeeHistory!.add(new EmployeeHistory.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeHistory != null) {
      data['employee_history'] =
          this.employeeHistory!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class EmployeeHistory {
  List<Attendance>? attendance;
  String? totalHours;
  Employee? employee;

  EmployeeHistory({this.attendance, this.totalHours});

  EmployeeHistory.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    totalHours = json['total_hours'];
    employee = Employee.fromJson(json['employee']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    data['total_hours'] = this.totalHours;
    data['employee'] = this.employee;
    return data;
  }
}

class Attendance {
  String? id;
  String? employeeId;
  String? adminId;
  String? assignedDate;
  String? inTime;
  String? outTime;
  String? assignedHours;
  String? completedHours;
  String? createdAt;
  String? updatedAt;

  Attendance(
      {this.id,
        this.employeeId,
        this.adminId,
        this.assignedDate,
        this.inTime,
        this.outTime,
        this.assignedHours,
        this.completedHours,
        this.createdAt,
        this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    adminId = json['admin_id'];
    assignedDate = json['assigned_date'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    assignedHours = json['assigned_hours'];
    completedHours = json['completed_hours'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['admin_id'] = this.adminId;
    data['assigned_date'] = this.assignedDate;
    data['in_time'] = this.inTime;
    data['out_time'] = this.outTime;
    data['assigned_hours'] = this.assignedHours;
    data['completed_hours'] = this.completedHours;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}