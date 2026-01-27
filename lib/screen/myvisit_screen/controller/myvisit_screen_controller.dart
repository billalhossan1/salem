import 'package:get/get.dart';

class VisitModel {
  final String salonName;
  final String date;
  final String status;
  final String points;

  VisitModel({
    required this.salonName,
    required this.date,
    required this.status,
    required this.points,
  });
}

class MyvisitScreenController extends GetxController {
  var currentPage = 0.obs;
  final int itemsPerPage = 3;

  final List<VisitModel> allVisits = [
    VisitModel(
      salonName: "Glamour Studio",
      date: "Jan 12, 2025",
      status: "Completed",
      points: "100 PTS",
    ),
    VisitModel(
      salonName: "20% off Hairstyle",
      date: "Jan 12, 2025",
      status: "Completed",
      points: "100 PTS",
    ),
    VisitModel(
      salonName: "Luxury Spa",
      date: "Jan 12, 2025",
      status: "Pending",
      points: "100 PTS",
    ),
    VisitModel(
      salonName: "Urban Cuts",
      date: "Jan 10, 2025",
      status: "Completed",
      points: "50 PTS",
    ),
    VisitModel(
      salonName: "Nail Artistry",
      date: "Jan 08, 2025",
      status: "Completed",
      points: "80 PTS",
    ),
    VisitModel(
      salonName: "Color Bar",
      date: "Jan 05, 2025",
      status: "Cancelled",
      points: "0 PTS",
    ),
    VisitModel(
      salonName: "Style Lounge",
      date: "Jan 01, 2025",
      status: "Completed",
      points: "120 PTS",
    ),
  ];

  List<VisitModel> get currentVisits {
    int start = currentPage.value * itemsPerPage;
    int end = start + itemsPerPage;
    if (end > allVisits.length) end = allVisits.length;
    if (start >= allVisits.length) return [];
    return allVisits.sublist(start, end);
  }

  void nextPage() {
    if ((currentPage.value + 1) * itemsPerPage < allVisits.length) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }
}
