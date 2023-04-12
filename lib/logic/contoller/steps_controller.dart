import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class StepsController extends GetxController {
  int steps = 0;

  Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
  @override
  void onInit() {
    super.onInit();
    updateSteps();
  }

  updateSteps() {
    stepCountStream.listen((stepCount) {
      steps = stepCount.steps;
      update();
    });
  }
}
