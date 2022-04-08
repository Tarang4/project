class NotificationModal {
  String? notificationId;
  String? notificationTime;
  String? notificationDate;
  String? title;
  String? description;

  NotificationModal(
      {this.notificationId,
        this.notificationTime,
        this.notificationDate,
        this.title,
        this.description});

  NotificationModal.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    notificationTime = json['notificationTime'];
    notificationDate = json['notificationDate'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationId'] = notificationId;
    data['notificationTime'] = notificationTime;
    data['notificationDate'] = notificationDate;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
