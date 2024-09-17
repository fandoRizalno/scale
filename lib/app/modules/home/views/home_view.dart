import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scale/app/modules/personal-data/views/personal_data_view.dart';
import 'package:scale/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Welcome to the Scale App, yourpersonal health tracker!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.PERSONAL_DATA);
                },
                child: const Text("Get Started")),
          )
        ]),
      ),
    );
  }
}
