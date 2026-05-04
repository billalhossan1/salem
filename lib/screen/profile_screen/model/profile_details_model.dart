import 'package:get/get.dart';

class ProfileModel {
  final int spentCoins;
  final String id;
  final String role;
  final String name;
  final String email;
  final String languages;
  final String phoneNumber;
  final bool verified;
  final String status;
  final bool isVibrationNotificationEnabled;
  final bool isSoundNotificationEnabled;
  final int coins;
  final String referralCode;
  final String invitedBy;
  final int successfulInvites;
  final bool isCompleted;
  final bool isOnline;
  final String lastActiveAt;
  final int v;
  final String updatedAt;
  final String createdAt;
  final bool notification;
  final String image;
  final int totalVisit;
  final String lastVisit;
  final List<AvailableReward> availableReward;

  ProfileModel({
    required this.spentCoins,
    required this.id,
    required this.role,
    required this.phoneNumber,
    required this.verified,
    required this.status,
    required this.languages,
    required this.isVibrationNotificationEnabled,
    required this.isSoundNotificationEnabled,
    required this.coins,
    required this.referralCode,
    required this.invitedBy,
    required this.successfulInvites,
    required this.isCompleted,
    required this.isOnline,
    required this.lastActiveAt,
    required this.v,
    required this.updatedAt,
    required this.notification,
    required this.image,
    required this.totalVisit,
    required this.lastVisit,
    required this.availableReward, required this.name, required this.createdAt, required this.email,
  });

  factory ProfileModel.empty() {
    return ProfileModel(
      spentCoins: 0,
      id: '',
      role: '',
      languages: '',
      phoneNumber: '',
      verified: false,
      status: '',
      isVibrationNotificationEnabled: false,
      isSoundNotificationEnabled: false,
      coins: 0,
      referralCode: '',
      invitedBy: '',
      successfulInvites: 0,
      isCompleted: false,
      isOnline: false,
      lastActiveAt: '',
      v: 0,
      updatedAt: '',
      notification: false,
      image: '',
      totalVisit: 0,
      lastVisit: '',
      availableReward: [], name: '', createdAt: '', email: '',
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      spentCoins: json['spentCoins'] is int
          ? json['spentCoins']
          : int.tryParse(json['spentCoins']?.toString() ?? '') ?? 0,
      id: json['_id']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
        languages: json['languages']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      verified: json['verified'] ?? false,
      status: json['status']?.toString() ?? '',
      isVibrationNotificationEnabled: json['isVibrationNotificationEnabled'] ?? false,
      isSoundNotificationEnabled: json['isSoundNotificationEnabled'] ?? false,
      coins: json['coins'] is int
          ? json['coins']
          : int.tryParse(json['coins']?.toString() ?? '') ?? 0,
      referralCode: json['referralCode']?.toString() ?? '',
      invitedBy: json['invitedBy']?.toString() ?? '',
      successfulInvites: json['successfulInvites'] is int
          ? json['successfulInvites']
          : int.tryParse(json['successfulInvites']?.toString() ?? '') ?? 0,
      isCompleted: json['isCompleted'] ?? false,
      isOnline: json['isOnline'] ?? false,
      lastActiveAt: json['lastActiveAt']?.toString() ?? '',
      v: json['__v'] is int
          ? json['__v']
          : int.tryParse(json['__v']?.toString() ?? '') ?? 0,
      updatedAt: json['updatedAt']?.toString() ?? '',
      notification: json['notification'] ?? false,
      image: json['image']?.toString() ?? '',
      totalVisit: json['TotalVisit'] is int
          ? json['TotalVisit']
          : int.tryParse(json['TotalVisit']?.toString() ?? '') ?? 0,
      lastVisit: json['LastVisit']?.toString() ?? '',
      availableReward: (json['availableReward'] as List?)
          ?.map((e) => AvailableReward.fromJson(e))
          .toList() ??
          [], name: json['name']?.toString() ?? '', createdAt: json['createdAt']?.toString() ?? '', email: json['email']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spentCoins': spentCoins,
      '_id': id,
      'role': role,
      'phoneNumber': phoneNumber,
      'verified': verified,
      'status': status,
      'isVibrationNotificationEnabled': isVibrationNotificationEnabled,
      'isSoundNotificationEnabled': isSoundNotificationEnabled,
      'coins': coins,
      'languages': languages,
      'referralCode': referralCode,
      'invitedBy': invitedBy,
      'successfulInvites': successfulInvites,
      'isCompleted': isCompleted,
      'isOnline': isOnline,
      'lastActiveAt': lastActiveAt,
      '__v': v,
      'updatedAt': updatedAt,
      'notification': notification,
      'image': image,
      'TotalVisit': totalVisit,
      'LastVisit': lastVisit,
      'availableReward': availableReward.map((e) => e.toJson()).toList(),
    };
  }
}

class AvailableReward {
  final String id;
  final String userId;
  final String type;
  final String title;
  final int discountAmount;
  final String expiresAt;
  final bool isUsed;
  final String source;
  final String createdAt;
  final int v;
  final String status;

  AvailableReward({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.discountAmount,
    required this.expiresAt,
    required this.isUsed,
    required this.source,
    required this.createdAt,
    required this.v,
    required this.status,
  });

  factory AvailableReward.empty() {
    return AvailableReward(
      id: '',
      userId: '',
      type: '',
      title: '',
      discountAmount: 0,
      expiresAt: '',
      isUsed: false,
      source: '',
      createdAt: '',
      v: 0,
      status: '',
    );
  }

  factory AvailableReward.fromJson(Map<String, dynamic> json) {
    return AvailableReward(
      id: json['_id']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      discountAmount: json['discountAmount'] is int
          ? json['discountAmount']
          : int.tryParse(json['discountAmount']?.toString() ?? '') ?? 0,
      expiresAt: json['expiresAt']?.toString() ?? '',
      isUsed: json['isUsed'] ?? false,
      source: json['source']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
      v: json['__v'] is int
          ? json['__v']
          : int.tryParse(json['__v']?.toString() ?? '') ?? 0,
      status: json['status']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'discountAmount': discountAmount,
      'expiresAt': expiresAt,
      'isUsed': isUsed,
      'source': source,
      'createdAt': createdAt,
      '__v': v,
      'status': status,
    };
  }
}