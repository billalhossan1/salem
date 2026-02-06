import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  // Track which screens have been visited
  final RxSet<int> visitedScreens = <int>{
    0,
  }.obs; // Start with home screen (index 0)

  void changeIndex(int index) {
    currentIndex.value = index;
    visitedScreens.add(index); // Mark this screen as visited
  }
}
