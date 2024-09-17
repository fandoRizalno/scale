import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scale/app/routes/app_pages.dart';

class BmiController extends GetxController {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final bodyFatController = TextEditingController();
  final muscleMassController = TextEditingController();
  final visceralFatController = TextEditingController();
  final basalMetabolismController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxDouble? weight = RxDouble(0.0);
  RxDouble? height = RxDouble(0.0);
  RxDouble? bodyFat = RxDouble(0.0);
  RxDouble? muscleMass = RxDouble(0.0);
  RxInt? visceralFat = RxInt(0);
  RxInt? basalMetabolism = RxInt(0);
  RxDouble bmi = 0.0.obs;
  RxString categoryBmi = "Normal".obs;

  void submitForm() {
    if (formKey.currentState!.validate()) {
      weight?.value = double.tryParse(weightController.text) ?? 0.0;
      height?.value = double.tryParse(heightController.text) ?? 0.0;

      bodyFat?.value = double.tryParse(bodyFatController.text) ?? 0.0;
      muscleMass?.value = double.tryParse(muscleMassController.text) ?? 0.0;
      visceralFat?.value = int.tryParse(visceralFatController.text) ?? 0;
      basalMetabolism?.value =
          int.tryParse(basalMetabolismController.text) ?? 0;

      double weightH = double.tryParse(weightController.text) ?? 0.0;
      double heightH = (double.tryParse(heightController.text) ?? 0.0) / 100;

      bmi.value = weightH / (heightH * heightH);
      if (bmi.value < 18.5) {
        categoryBmi.value = 'Underweight';
      } else if (bmi.value >= 18.5 && bmi.value <= 22.9) {
        categoryBmi.value = 'Normal';
      } else if (bmi.value >= 23.0 && bmi.value < 25.0) {
        categoryBmi.value = 'Overweight';
      } else {
        categoryBmi.value = 'Obesity';
      }

      Get.toNamed(Routes.PROFILE);
    }
  }
}
