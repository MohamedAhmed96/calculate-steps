import 'package:calculate_steps/logic/binding/steps_binding.dart';
import 'package:calculate_steps/view/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const homeScreen = Routes.homeScreen;

  static final pages = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: StepsBinding(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
}
