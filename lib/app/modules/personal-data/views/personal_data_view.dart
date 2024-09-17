import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scale/app/routes/app_pages.dart';

import '../controllers/personal_data_controller.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (controller.validate()) {
              Get.toNamed(Routes.BMI);
            }
          },
          child: const Text('Next'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Gender Selection:',
              style: TextStyle(fontSize: 18),
            ),
            Obx(() => Row(
                  children: <Widget>[
                    Radio<String?>(
                      value: 'Male',
                      groupValue: controller.gender.value,
                      onChanged: (String? value) {
                        controller.setGender(value!);
                      },
                    ),
                    const Text('Male'),
                    Radio<String?>(
                      value: 'Female',
                      groupValue: controller.gender.value,
                      onChanged: (String? value) {
                        controller.setGender(value!);
                      },
                    ),
                    const Text('Female'),
                  ],
                )),
            Obx(() => controller.genderError.isNotEmpty
                ? Text(
                    controller.genderError.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink()),
            const SizedBox(height: 50),
            const Text(
              'Date of Birth',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Obx(() => Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        controller.selectedDate.value != null
                            ? 'Date of Birth: ${DateFormat('dd/MM/yyyy').format(controller.selectedDate.value ?? DateTime.now())}'
                            : "  -",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.selectDate(context),
                      child: const Text('Select Date'),
                    ),
                  ],
                )),
            Obx(() => controller.dateError.isNotEmpty
                ? Text(
                    controller.dateError.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink()),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
