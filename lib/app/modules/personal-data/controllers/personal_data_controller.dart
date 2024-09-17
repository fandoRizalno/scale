import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDataController extends GetxController {
  Rxn<String> gender = Rxn<String>();

  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  RxString genderError = ''.obs;
  RxString dateError = ''.obs;

  bool validate() {
    bool isValid = true;

    if (gender.value == null) {
      genderError.value = 'Gender must be selected';
      isValid = false;
    } else {
      genderError.value = '';
    }

    if (selectedDate.value == null) {
      dateError.value = 'Date of birth must be selected';
      isValid = false;
    } else {
      dateError.value = '';
    }

    return isValid;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
