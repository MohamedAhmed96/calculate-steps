import 'package:calculate_steps/logic/contoller/steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final stepsController = Get.put(StepsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<StepsController>(builder: (stepsController) {
        return Center(
          child: Text(stepsController.steps.toString()),
        );
      })),
    );
  }
}
