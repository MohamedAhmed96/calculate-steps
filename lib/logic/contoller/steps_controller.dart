import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StepsController extends GetxController {
  int _stepCount = 0;
  bool _isCounting = false;

  getSteps() {
    return _stepCount;
  }

  void _initAccelerometer() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      double y = event.y;

      if (!_isCounting && y < -1.0) {
        // setState(() {
        _stepCount++;
        _isCounting = true;
        update();
        // });
      } else if (_isCounting && y > 0.5) {
        _isCounting = false;
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    _initAccelerometer();
  }
}
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StepsController extends GetxController {
//   int totalSteps = 0;
//   String today = DateTime.now().toString();
//   int todaySteps = 0;
//   late final SharedPreferences prefs;

//   Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
//   @override
//   void onInit() async {
//     super.onInit();
//     prefs = await SharedPreferences.getInstance();
//     calculateTodaySteps();
//   }

//   getTotalSteps() {
//     stepCountStream.listen((stepCount) {
//       totalSteps = stepCount.steps;
//       update();
//     });
//   }

//   calculateTodaySteps() {
//     stepCountStream.listen((stepCount) {
//       if (totalSteps == 0) {
//         totalSteps = stepCount.steps;
//         print('start total steps was 0 then => $totalSteps');
//       } else {
//         if (prefs.getString('today') ==
//             DateFormat("yyyy-MM-dd").format(DateTime.now())) {
//           print('today steps was $todaySteps');
//           prefs.setInt('todaySteps',
//               stepCount.steps - totalSteps + prefs.getInt('todaySteps')!);
//           totalSteps = stepCount.steps;
//           todaySteps = prefs.getInt('todaySteps')!;
//           print('then $todaySteps');
//         } else {
//           prefs.setString(
//               'today', DateFormat("yyyy-MM-dd").format(DateTime.now()));
//           today = prefs.getString('today')!;
//           prefs.setInt('todaySteps', 0);
//           todaySteps = prefs.getInt('todaySteps')!;
//         }
//       }
//       update();
//     });
//   }
// }
