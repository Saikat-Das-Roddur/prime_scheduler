import 'history.dart';

class Attendances{
  List<Attendance>? attendances;
  int? statusCode;
  Attendances({this.attendances, this.statusCode});

  Attendances.fromJson(Map<String, dynamic> json) {
    if (json['attendances'] != null) {
      attendances = <Attendance>[];
      json['attendances'].forEach((v) {
        attendances!.add( Attendance.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendances != null) {
      data['attendances'] =
          this.attendances!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}