import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/completed_task_list_controller.dart';

class CompletedTaskListView extends GetView<CompletedTaskListController> {
  const CompletedTaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CompletedTaskListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CompletedTaskListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
