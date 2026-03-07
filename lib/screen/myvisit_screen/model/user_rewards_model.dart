class UserRewardsModel {
  final String sId;
  final String userId;
  final SalonId salonId;
  final String rewardId;
  final int pointCost;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int iV;

  const UserRewardsModel({
    this.sId = '',
    this.userId = '',
    this.salonId = const SalonId(),
    this.rewardId = '',
    this.pointCost = 0,
    this.status = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  factory UserRewardsModel.fromJson(Map<String, dynamic> json) {
    return UserRewardsModel(
      sId: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      salonId:
      json['salonId'] != null ? SalonId.fromJson(json['salonId']) : const SalonId(),
      rewardId: json['rewardId'] ?? '',
      pointCost: json['pointCost'] ?? 0,
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      iV: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'userId': userId,
      'salonId': salonId.toJson(),
      'rewardId': rewardId,
      'pointCost': pointCost,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
    };
  }
}

class SalonId {
  final String sId;
  final String businessName;
  final String service;

  const SalonId({
    this.sId = '',
    this.businessName = '',
    this.service = '',
  });

  factory SalonId.fromJson(Map<String, dynamic> json) {
    return SalonId(
      sId: json['_id'] ?? '',
      businessName: json['businessName'] ?? '',
      service: json['service'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'businessName': businessName,
      'service': service,
    };
  }
}