import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

class SalonScreenController extends GetxController {
  var selectedTab = "Nearest".obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  final List<Map<String, dynamic>> salonList = [
    {
      "image": AppImages.nearBySalon1,
      "name": "Bloom Beauty",
      "distance": "📍 1.2 km",
      "description": "Luxury hair & skin care",
      "status": "4.3",
      "isPopular": true,
    },
    {
      "image": AppImages.nearBySalon2,
      "name": "Urban Chic Salon",
      "distance": "📍 2.5 km",
      "description": "Modern styling & spa",
      "status": "4.4",
      "isPopular": false,
    },
    {
      "image": AppImages.nearBySalon3,
      "name": "Serenity Spa",
      "distance": "📍 3.8 km",
      "description": "Relaxing massages & facials",
      "status": "4.5",
      "isPopular": true,
    },
    {
      "image": AppImages.nearBySalon4,
      "name": "Glamour Studio",
      "distance": "📍 0.8 km",
      "description": "Makeup & nail artistry",
      "status": "4.5",
      "isPopular": false,
    },
    {
      "image": AppImages.nearBySalon1,
      "name": "Pure Elegance",
      "distance": "📍 1.5 km",
      "description": "Holistic beauty treatments",
      "status": "4.5",
      "isPopular": true,
    },
    {
      "image": AppImages.nearBySalon2,
      "name": "The Style Loft",
      "distance": "📍 4.2 km",
      "description": "Cutting-edge hair design",
      "status": "4.5",
      "isPopular": false,
    },
  ];

  List<Map<String, dynamic>> get filteredSalonList {
    if (selectedTab.value == "Popular") {
      return salonList.where((salon) => salon["isPopular"] == true).toList();
    } else if (selectedTab.value == "Rating") {
      // Mock logic: Sort by status (rating) descending
      var list = List<Map<String, dynamic>>.from(salonList);
      list.sort(
        (a, b) => (b["status"] as String).compareTo(a["status"] as String),
      );
      return list;
    }
    // "Nearest" or default
    return salonList;
  }
}
