class NotificationItemModel {
  final String sId;
  final String receiverId;
  final String title;
  final String body;
  final String notificationType;
  final String notificationEvent;
   bool read;
  final String status;
  final int iV;

   NotificationItemModel({
    this.sId = '',
    this.receiverId = '',
    this.title = '',
    this.body = '',
    this.notificationType = '',
    this.notificationEvent = '',
    this.read = false,
    this.status = '',
    this.iV = 0,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      sId: json['_id'] ?? '',
      receiverId: json['receiverId'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      notificationType: json['notificationType'] ?? '',
      notificationEvent: json['notificationEvent'] ?? '',
      read: json['read'] ?? false,
      status: json['status'] ?? '',
      iV: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'receiverId': receiverId,
      'title': title,
      'body': body,
      'notificationType': notificationType,
      'notificationEvent': notificationEvent,
      'read': read,
      'status': status,
      '__v': iV,
    };
  }
}