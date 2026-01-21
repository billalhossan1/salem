import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

class HomeScreenController extends GetxController {
  final List<Map<String, String>> exclusiveOffers = [
    {
      "image": AppImages.homeImage1,
      "title": "20% off Hairstyles",
      "subtitle": "Valid Until Friday",
    },
    {
      "image": AppImages.homeImage2,
      "title": "Free Manicure",
      "subtitle": "With any hair color",
    },
    {
      "image": AppImages.homeImage3,
      "title": "15% off Facials",
      "subtitle": "Weekend Special",
    },
  ];
}
