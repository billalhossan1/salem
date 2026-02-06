import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteModel {
  final String name;
  final String joinDate;
  final String points;
  final String status;
  final Color avatarColor;

  InviteModel({
    required this.name,
    required this.joinDate,
    required this.points,
    required this.status,
    required this.avatarColor,
  });
}

class InviteHistoryController extends GetxController {
  final List<InviteModel> recentActivity = [
    InviteModel(
      name: "Sarah Jenkins",
      joinDate: "Joined Oct 24, 2025",
      points: "30+",
      status: "Completed",
      avatarColor: Color(0xFFE8F5E9), // Light Green
    ),
    InviteModel(
      name: "Sarah Jenkins",
      joinDate: "Joined Oct 24, 2025",
      points: "30+",
      status: "Completed",
      avatarColor: Color(0xFFFFF8E1), // Light Yellow
    ),
    InviteModel(
      name: "Sarah Jenkins",
      joinDate: "Joined Oct 24, 2025",
      points: "30+",
      status: "Completed",
      avatarColor: Color(0xFFFFEBEE), // Light Pink
    ),
    InviteModel(
      name: "Sarah Jenkins",
      joinDate: "Joined Oct 24, 2025",
      points: "30+",
      status: "Completed",
      avatarColor: Color(0xFFE8F5E9),
    ),
    InviteModel(
      name: "Sarah Jenkins",
      joinDate: "Joined Oct 24, 2025",
      points: "30+",
      status: "Completed",
      avatarColor: Color(0xFFFFF8E1),
    ),
  ];
}
