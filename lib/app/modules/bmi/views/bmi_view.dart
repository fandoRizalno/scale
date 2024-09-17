import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scale/app/modules/bmi/controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  const BmiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Form '),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: controller.submitForm,
          child: const Text('Submit'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: controller.weightController,
                decoration: const InputDecoration(
                  labelText: 'Current Weight (Kg)',
                  hintText: 'Enter your weight',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Current Weight is mandatory';
                  }
                  final weight = double.tryParse(value);
                  if (weight == null || weight <= 0 || weight > 999.9) {
                    return 'Free number input with a maximum of 3 digits, allowing decimals (e.g., 75.5kg).';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (Cm)',
                  hintText: 'Enter your height',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Height is mandatory';
                  }
                  final height = double.tryParse(value);
                  if (height == null || height <= 0 || height > 999.9) {
                    return 'Free number input with a maximum of 3 digits, allowing decimals (e.g., 170.5cm).';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.bodyFatController,
                decoration: const InputDecoration(
                  labelText: 'Body Fat (%)',
                  hintText: 'Enter body fat percentage (optional)',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final bodyFat = double.tryParse(value);
                    if (bodyFat == null || bodyFat < 0 || bodyFat > 99.9) {
                      return 'Free number input, maximum of 2 digits, allowing decimals (e.g., 12.5%).';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.muscleMassController,
                decoration: const InputDecoration(
                  labelText: 'Muscle Mass  (Kg)',
                  hintText: 'Enter your Muscle Mass (optional)',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final muscleMass = double.tryParse(value);
                    if (muscleMass == null ||
                        muscleMass < 0 ||
                        muscleMass > 99.9) {
                      return 'Free number input, maximum of 2 digits, allowing decimals (e.g., 40.2 kg).';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.visceralFatController,
                decoration: const InputDecoration(
                  labelText: 'Visceral Fat',
                  hintText: 'Enter your Visceral Fat (opsional)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final visceralFat = int.tryParse(value);
                    if (visceralFat == null ||
                        visceralFat < 1 ||
                        visceralFat > 12) {
                      return 'Free number input, restricted to values between 1 and 12 (no decimals).';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.basalMetabolismController,
                decoration: const InputDecoration(
                  labelText: 'Basal Metabolism (Kkal)',
                  hintText: 'Enter your Basal Metabolism (opsional)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final basalMetabolism = int.tryParse(value);
                    if (basalMetabolism == null ||
                        basalMetabolism < 1000 ||
                        basalMetabolism > 9999) {
                      return 'Free number input for values in thousands (e.g., 1300 kcal), limited to 4 digits.';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
