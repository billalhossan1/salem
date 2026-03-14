import 'package:get/get.dart';

class RewardHistoryModel {
  final Salon salon;
  final List<History> history;

  RewardHistoryModel({
    required this.salon,
    required this.history,
  });

  factory RewardHistoryModel.empty() {
    return RewardHistoryModel(
      salon: Salon.empty(),
      history: [],
    );
  }

  factory RewardHistoryModel.fromJson(Map<String, dynamic> json) {
    return RewardHistoryModel(
      salon: json['salon'] != null
          ? Salon.fromJson(json['salon'])
          : Salon.empty(),
      history: (json['history'] as List?)
          ?.map((e) => History.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'salon': salon.toJson(),
      'history': history.map((e) => e.toJson()).toList(),
    };
  }
}

class Salon {
  final String businessName;
  final String location;
  final String service;

  Salon({
    required this.businessName,
    required this.location,
    required this.service,
  });

  factory Salon.empty() {
    return Salon(
      businessName: '',
      location: '',
      service: '',
    );
  }

  factory Salon.fromJson(Map<String, dynamic> json) {
    return Salon(
      businessName: json['businessName']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      service: json['service']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'location': location,
      'service': service,
    };
  }
}

class History {
  final String id;
  final int points;
  final String createdAt;

  History({
    required this.id,
    required this.points,
    required this.createdAt,
  });

  factory History.empty() {
    return History(
      id: '',
      points: 0,
      createdAt: '',
    );
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['_id']?.toString() ?? '',
      points: json['points'] is int
          ? json['points']
          : int.tryParse(json['points']?.toString() ?? '') ?? 0,
      createdAt: json['createdAt']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'points': points,
      'createdAt': createdAt,
    };
  }
}