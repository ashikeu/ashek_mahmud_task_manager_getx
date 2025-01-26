import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/progress_task_list_controller.dart';

class ProgressTaskListView extends GetView<ProgressTaskListController> {
  const ProgressTaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressTaskListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgressTaskListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
