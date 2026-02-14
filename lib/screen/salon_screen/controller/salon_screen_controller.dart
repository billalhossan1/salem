import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

class SalonScreenController extends GetxController {
  final List<Map<String, String>> salonList = [
    {
      "image": AppImages.nearBySalon1,
      "name": "Bloom Beauty",
      "distance": "📍1.2 km",
      "description": "Luxury hair & skin care",
      "status": "🎁 Rewards active",
    },
    {
      "image": AppImages.nearBySalon2,
      "name": "Urban Chic Salon",
      "distance": "📍2.5 km",
      "description": "Modern styling & spa",
      "status": "🎁 Rewards active",
    },
    {
      "image": AppImages.nearBySalon3,
      "name": "Serenity Spa",
      "distance": "📍3.8 km",
      "description": "Relaxing massages & facials",
      "status": "🎁 Rewards active",
    },
    {
      "image": AppImages.nearBySalon4,
      "name": "Glamour Studio",
      "distance": "📍0.8 km",
      "description": "Makeup & nail artistry",
      "status": "🎁 Rewards active",
    },
    {
      "image": AppImages.nearBySalon1,
      "name": "Pure Elegance",
      "distance": "📍1.5 km",
      "description": "Holistic beauty treatments",
      "status": "🎁 Rewards active",
    },
    {
      "image": AppImages.nearBySalon2,
      "name": "The Style Loft",
      "distance": "📍4.2 km",
      "description": "Cutting-edge hair design",
      "status": "🎁 Rewards active",
    },
  ];
}
