class Schedules {
  List<Schedule>? schedule;
  int? statusCode;
  int? totalEmployee;

  Schedules({this.schedule, this.statusCode, this.totalEmployee});

  Schedules.fromJson(Map<String, dynamic> json) {
    if (json['schedule'] != null) {
      schedule =  <Schedule>[];
      json['schedule'].forEach((v) {
        schedule?.add( Schedule.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    totalEmployee = json['total_employee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.schedule != null) {
      data['schedule'] = this.schedule?.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['total_employee'] = this.totalEmployee;
    return data;
  }
}

class Schedule {
  String? id;
  String? adminId;
  String? assignedDate;
  String? location;
  String? employeeId;
  String? employeeName;
  String? employeeCategory;
  String? terms;
  String? startTime;
  String? endTime;
  String? image;
  String? createdAt;
  String? updatedAt;

  Schedule(
      {this.id,
        this.adminId,
        this.assignedDate,
        this.location,
        this.employeeId,
        this.employeeName,
        this.employeeCategory,
        this.terms,
        this.startTime,
        this.endTime,
        this.image,
        this.createdAt,
        this.updatedAt});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    assignedDate = json['assigned_date'];
    location = json['location'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    employeeCategory = json['employee_category'];
    terms = json['terms'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['assigned_date'] = this.assignedDate;
    data['location'] = this.location;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['employee_category'] = this.employeeCategory;
    data['terms'] = this.terms;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}