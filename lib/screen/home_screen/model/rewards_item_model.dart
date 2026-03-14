import 'package:get/get.dart';

class RewardsItemModel {
  final String id;
  final String salonId;
  final String ownerId;
  final String rewardName;
  final String rewardImage;
  final int rewardPoints;
  final int visitorPoints;
  final String service;
  final String description;
  final List<String> whatsIncluded;
  final String redemptionPolicy;
  final bool rewardStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ClosedDays> closedDays;

  RewardsItemModel({
    required this.id,
    required this.salonId,
    required this.ownerId,
    required this.rewardName,
    required this.rewardImage,
    required this.rewardPoints,
    required this.service,
    required this.description,
    required this.whatsIncluded,
    required this.redemptionPolicy,
    required this.rewardStatus,
    required this.closedDays,
    this.createdAt,
    this.updatedAt, required this.visitorPoints,
  });

  factory RewardsItemModel.fromJson(Map<String, dynamic> json) {
    return RewardsItemModel(
      id: json['_id']?.toString() ?? '',
      salonId: json['salonId']?.toString() ?? '',
      ownerId: json['ownerId']?.toString() ?? '',
      rewardName: json['rewardName']?.toString() ?? '',
      rewardImage: json['rewardImage']?.toString() ?? '',
      rewardPoints: json['rewardPoints'] is int
          ? json['rewardPoints']
          : int.tryParse(json['rewardPoints']?.toString() ?? '') ?? 0,
      service: json['service']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      whatsIncluded: (json['whatsIncluded'] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      redemptionPolicy: json['redemptionPolicy']?.toString() ?? '',
      rewardStatus: json['rewardStatus'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      closedDays: (json['closedDays'] as List?)
          ?.map((e) => ClosedDays.fromJson(e))
          .toList() ??
          [],
      visitorPoints: json['VisitorCoin'] is int
          ? json['VisitorCoin']
          : json['visitorPoints'] is int
              ? json['visitorPoints']
              : int.tryParse(
                      (json['VisitorCoin'] ?? json['visitorPoints'])
                          ?.toString() ??
                          '') ??
                  0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'salonId': salonId,
      'ownerId': ownerId,
      'rewardName': rewardName,
      'rewardImage': rewardImage,
      'rewardPoints': rewardPoints,
      'service': service,
      'description': description,
      'whatsIncluded': whatsIncluded,
      'redemptionPolicy': redemptionPolicy,
      'rewardStatus': rewardStatus,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'closedDays': closedDays.map((e) => e.toJson()).toList(),
      'VisitorCoin': visitorPoints,
    };
  }
}

class ClosedDays {
  final String id;
  final String day;
  final bool isClosed;

  ClosedDays({
    required this.id,
    required this.day,
    required this.isClosed,
  });

  factory ClosedDays.fromJson(Map<String, dynamic> json) {
    return ClosedDays(
      id: json['_id']?.toString() ?? '',
      day: json['day']?.toString() ?? '',
      isClosed: json['isClosed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'isClosed': isClosed,
    };
  }
}