import 'package:get/get.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';

class NotificationScreenController extends GetxController {
  final List<Map<String, String>> notifications = List.generate(20, (index) {
    if (index % 3 == 0) {
      return {
        "icon": AppIcons.blackStar,
        "title": "Salon Review",
        "time": "How was your visit? Rate your salon.",
      };
    } else if (index % 3 == 1) {
      return {
        "icon": AppIcons.blackStar,
        "title": "New appointment booked successfully",
        "time": "${index + 1} hours ago",
      };
    } else {
      return {
        "icon": AppIcons.blackStar,
        "title": "Special offer just for you!",
        "time": "${index + 1} days ago",
      };
    }
  });
}
