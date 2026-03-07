class ActiveRewardsModel {
  final List<Purchases> purchases;

  ActiveRewardsModel({
    this.purchases = const [],
  });

  factory ActiveRewardsModel.fromJson(Map<String, dynamic> json) {
    return ActiveRewardsModel(
      purchases: (json['purchases'] as List? ?? [])
          .map((e) => Purchases.fromJson(e))
          .toList(),
    );
  }
}

class Purchases {
  final String sId;
  final UserId userId;
  final SalonId salonId;
  final RewardId rewardId;
  final int pointCost;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int iV;

  Purchases({
    this.sId = '',
    this.userId = const UserId(),
    this.salonId = const SalonId(),
    this.rewardId = const RewardId(),
    this.pointCost = 0,
    this.status = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  factory Purchases.fromJson(Map<String, dynamic> json) {
    return Purchases(
      sId: json['_id'] ?? '',
      userId: json['userId'] != null
          ? UserId.fromJson(json['userId'])
          : const UserId(),
      salonId: json['salonId'] != null
          ? SalonId.fromJson(json['salonId'])
          : const SalonId(),
      rewardId: json['rewardId'] != null
          ? RewardId.fromJson(json['rewardId'])
          : const RewardId(),
      pointCost: json['pointCost'] ?? 0,
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      iV: json['__v'] ?? 0,
    );
  }
}

class UserId {
  final String sId;
  final String phoneNumber;
  final int coins;

  const UserId({
    this.sId = '',
    this.phoneNumber = '',
    this.coins = 0,
  });

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      sId: json['_id'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      coins: json['coins'] ?? 0,
    );
  }

}

class SalonId {
  final String sId;
  final String businessName;
  final String image;
  final String service;

  const SalonId({
    this.sId = '',
    this.businessName = '',
    this.image = '',
    this.service = '',
  });

  factory SalonId.fromJson(Map<String, dynamic> json) {
    return SalonId(
      sId: json['_id'] ?? '',
      businessName: json['businessName'] ?? '',
      image: json['image'] ?? '',
      service: json['service'] ?? '',
    );
  }

}

class RewardId {
  final String sId;
  final String rewardName;
  final String rewardImage;
  final int rewardPoints;

  const RewardId({
    this.sId = '',
    this.rewardName = '',
    this.rewardImage = '',
    this.rewardPoints = 0,
  });

  factory RewardId.fromJson(Map<String, dynamic> json) {
    return RewardId(
      sId: json['_id'] ?? '',
      rewardName: json['rewardName'] ?? '',
      rewardImage: json['rewardImage'] ?? '',
      rewardPoints: json['rewardPoints'] ?? 0,
    );
  }

}

class Rewards {
  final String sId;
  final String userId;
  final String type;
  final String title;
  final int discountAmount;
  final String expiresAt;
  final bool isUsed;
  final String source;
  final String createdAt;
  final int iV;
  final String status;

  const Rewards({
    this.sId = '',
    this.userId = '',
    this.type = '',
    this.title = '',
    this.discountAmount = 0,
    this.expiresAt = '',
    this.isUsed = false,
    this.source = '',
    this.createdAt = '',
    this.iV = 0,
    this.status = '',
  });

  factory Rewards.fromJson(Map<String, dynamic> json) {
    return Rewards(
      sId: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      discountAmount: json['discountAmount'] ?? 0,
      expiresAt: json['expiresAt'] ?? '',
      isUsed: json['isUsed'] ?? false,
      source: json['source'] ?? '',
      createdAt: json['createdAt'] ?? '',
      iV: json['__v'] ?? 0,
      status: json['status'] ?? '',
    );
  }

}