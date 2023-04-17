import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class StepsController extends GetxController {
  int steps = 0;
  int totalSteps = 0;
  bool inSession = false;

  Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
  @override
  void onInit() {
    super.onInit();
    getTotalSteps();
  }

  getTotalSteps() {
    stepCountStream.listen((stepCount) {
      totalSteps = stepCount.steps;
      update();
    });
  }

  startSessionSteps() {
    print(inSession);
    stepCountStream.listen((stepCount) {
      steps++;
      inSession = true;
      update();
    });
  }

  resetSessionSteps() {
    print(inSession);
    steps = 0;
    inSession = false;
    update();
  }
}
