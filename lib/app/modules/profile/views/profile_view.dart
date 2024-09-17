import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scale/app/modules/bmi/controllers/bmi_controller.dart';
import 'package:scale/app/modules/personal-data/controllers/personal_data_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PersonalDataController personalDataController =
        Get.put(PersonalDataController());
    final BmiController bmiController = Get.put(BmiController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile View'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender: ${personalDataController.gender}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tanggal Lahir: ${DateFormat('dd/MM/yyyy').format(personalDataController.selectedDate.value ?? DateTime.now())}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Current Weight: ${bmiController.weight} Kg',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Height: ${bmiController.height} Cm',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Body Fat: ${bmiController.bodyFat} %',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Muscle Mass: ${bmiController.muscleMass} Kg',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Visceral Fat: ${bmiController.visceralFat}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Basal Metabolism: ${bmiController.basalMetabolism} Kcal',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
                Text(
                  'BMI Score: ${bmiController.bmi}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Category BMI: ${bmiController.categoryBmi}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
