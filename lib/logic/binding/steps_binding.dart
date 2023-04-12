import 'package:calculate_steps/logic/contoller/steps_controller.dart';
import 'package:get/get.dart';

class StepsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StepsController());
  }
}
