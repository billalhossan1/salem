import 'package:get/get.dart';

class TiarModel {
  final String sId;
  final String userId;
  final String tireName;
  final int tireCoins;
  final String createdAt;
  final String updatedAt;
  final int iV;

  TiarModel({
    this.sId = '',
    this.userId = '',
    this.tireName = '',
    this.tireCoins = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
  });

  factory TiarModel.fromJson(Map<String, dynamic> json) {
    return TiarModel(
      sId: json['_id']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      tireName: json['tireName']?.toString() ?? '',
      tireCoins: json['tireCoins'] is int
          ? json['tireCoins']
          : int.tryParse(json['tireCoins']?.toString() ?? '') ?? 0,
      createdAt: json['createdAt']?.toString() ?? '',
      updatedAt: json['updatedAt']?.toString() ?? '',
      iV: json['__v'] is int
          ? json['__v']
          : int.tryParse(json['__v']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'userId': userId,
      'tireName': tireName,
      'tireCoins': tireCoins,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
    };
  }
}
