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
  var searchText = ''.obs;
  var isDateAscending = false.obs;

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
    VisitModel(
      salonName: "Elite Barber",
      date: "Dec 28, 2024",
      status: "Completed",
      points: "45 PTS",
    ),
    VisitModel(
      salonName: "Pure Elegance",
      date: "Dec 25, 2024",
      status: "Completed",
      points: "90 PTS",
    ),
    VisitModel(
      salonName: "The Hair Loft",
      date: "Dec 20, 2024",
      status: "Completed",
      points: "60 PTS",
    ),
    VisitModel(
      salonName: "Modern Touch",
      date: "Dec 15, 2024",
      status: "Pending",
      points: "75 PTS",
    ),
    VisitModel(
      salonName: "Beauty Haven",
      date: "Dec 10, 2024",
      status: "Completed",
      points: "110 PTS",
    ),
  ];

  List<VisitModel> get filteredVisits {
    List<VisitModel> results = List.from(allVisits);

    // Filter by search text
    if (searchText.value.isNotEmpty) {
      results = results.where((visit) {
        return visit.salonName.toLowerCase().contains(searchText.value.toLowerCase());
      }).toList();
    }

    // Sort by date
    results.sort((a, b) {
      DateTime dateA = _parseDate(a.date);
      DateTime dateB = _parseDate(b.date);
      return isDateAscending.value
          ? dateA.compareTo(dateB)
          : dateB.compareTo(dateA);
    });

    return results;
  }

  void updateSearchText(String value) {
    searchText.value = value;
  }

  void toggleDateSort() {
    isDateAscending.value = !isDateAscending.value;
  }

  DateTime _parseDate(String dateStr) {
    // Format: "Jan 12, 2025"
    try {
      final parts = dateStr.split(' ');
      if (parts.length != 3) return DateTime.now();

      final monthStr = parts[0];
      final day = int.tryParse(parts[1].replaceAll(',', '')) ?? 1;
      final year = int.tryParse(parts[2]) ?? 2025;

      int month = 1;
      const months = {
        'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6,
        'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12
      };
      
      month = months[monthStr] ?? 1;

      return DateTime(year, month, day);
    } catch (e) {
      return DateTime.now();
    }
  }
}
