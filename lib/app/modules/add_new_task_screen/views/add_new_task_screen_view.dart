import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_new_task_screen_controller.dart';

class AddNewTaskScreenView extends GetView<AddNewTaskScreenController> {
  const AddNewTaskScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNewTaskScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddNewTaskScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
