class UsedRewardModel {
  final String id;
  final UserId userId;
  final SalonId salonId;
  final RewardId rewardId;
  final String status;
  final int v;
  final int pointCost;
  final String createdAt;

  UsedRewardModel({
    required this.id,
    required this.userId,
    required this.salonId,
    required this.rewardId,
    required this.status,
    required this.v,
    required this.pointCost, required this.createdAt,
  });

  factory UsedRewardModel.empty() {
    return UsedRewardModel(
      id: '',
      userId: UserId.empty(),
      salonId: SalonId.empty(),
      rewardId: RewardId.empty(),
      status: '',
      v: 0,
      pointCost: 0, createdAt: '',
    );
  }

  factory UsedRewardModel.fromJson(Map<String, dynamic> json) {
    return UsedRewardModel(
      id: json['_id']?.toString() ?? '',
      userId: json['userId'] != null
          ? UserId.fromJson(json['userId'])
          : UserId.empty(),
      salonId: json['salonId'] != null
          ? SalonId.fromJson(json['salonId'])
          : SalonId.empty(),
      rewardId: json['rewardId'] != null
          ? RewardId.fromJson(json['rewardId'])
          : RewardId.empty(),
      status: json['status']?.toString() ?? '',
      v: json['__v'] is int
          ? json['__v']
          : int.tryParse(json['__v']?.toString() ?? '') ?? 0,
      pointCost: json['pointCost'] is int
          ? json['pointCost']
          : int.tryParse(json['pointCost']?.toString() ?? '') ?? 0, createdAt: json['createdAt']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId.toJson(),
      'salonId': salonId.toJson(),
      'rewardId': rewardId.toJson(),
      'status': status,
      '__v': v,
      'pointCost': pointCost,
    };
  }
}

class UserId {
  final String id;
  final String phoneNumber;
  final int coins;

  UserId({
    required this.id,
    required this.phoneNumber,
    required this.coins,
  });

  factory UserId.empty() {
    return UserId(
      id: '',
      phoneNumber: '',
      coins: 0,
    );
  }

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json['_id']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      coins: json['coins'] is int
          ? json['coins']
          : int.tryParse(json['coins']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'phoneNumber': phoneNumber,
      'coins': coins,
    };
  }
}

class SalonId {
  final String id;
  final String businessName;

  SalonId({
    required this.id,
    required this.businessName,
  });

  factory SalonId.empty() {
    return SalonId(
      id: '',
      businessName: '',
    );
  }

  factory SalonId.fromJson(Map<String, dynamic> json) {
    return SalonId(
      id: json['_id']?.toString() ?? '',
      businessName: json['businessName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'businessName': businessName,
    };
  }
}

class RewardId {
  final String id;
  final String rewardName;
  final String rewardImage;
  final int rewardPoints;

  RewardId({
    required this.id,
    required this.rewardName,
    required this.rewardPoints, required this.rewardImage,
  });

  factory RewardId.empty() {
    return RewardId(
      id: '',
      rewardName: '',
      rewardPoints: 0, rewardImage: '',
    );
  }

  factory RewardId.fromJson(Map<String, dynamic> json) {
    return RewardId(
      id: json['_id']?.toString() ?? '',
      rewardName: json['rewardName']?.toString() ?? '',
      rewardPoints: json['rewardPoints'] is int
          ? json['rewardPoints']
          : int.tryParse(json['rewardPoints']?.toString() ?? '') ?? 0, rewardImage: json['rewardImage']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'rewardName': rewardName,
      'rewardPoints': rewardPoints,
    };
  }
}