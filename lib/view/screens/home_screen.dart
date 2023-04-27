import 'package:calculate_steps/logic/contoller/steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final stepsController = Get.put(StepsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<StepsController>(builder: (stepsController) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your total Steps'),
              Text(stepsController.totalSteps.toString()),
              Container(
                height: 5.h,
                width: 35.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(3.w)),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // stepsController.inSession
                      //     ? stepsController.resetSessionSteps()
                      //     : stepsController.startSessionSteps();
                    },
                    child: Text(
                      stepsController.todaySteps.toString(),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      })),
    );
  }
}
