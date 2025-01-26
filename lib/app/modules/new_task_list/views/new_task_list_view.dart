import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_task_list_controller.dart';

class NewTaskListView extends GetView<NewTaskListController> {
  const NewTaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewTaskListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewTaskListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
