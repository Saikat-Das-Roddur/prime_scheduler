class AnnouncementResponse {
  List<Announcement>? announcement;
  int? statusCode;

  AnnouncementResponse({this.announcement, this.statusCode});

  AnnouncementResponse.fromJson(Map<String, dynamic> json) {
    if (json['announcement'] != null) {
      announcement =  <Announcement>[];
      json['announcement'].forEach((v) {
        announcement?.add(new Announcement.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.announcement != null) {
      data['announcement'] = this.announcement?.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Announcement {
  String? id;
  String? adminId;
  String? title;
  String? description;
  String? date;
  String? createdAt;
  String? updatedAt;

  Announcement(
      {this.id,
        this.adminId,
        this.title,
        this.description,
        this.date,
        this.createdAt,
        this.updatedAt});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
