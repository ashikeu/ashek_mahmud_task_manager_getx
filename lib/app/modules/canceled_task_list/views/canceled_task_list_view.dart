import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/canceled_task_list_controller.dart';

class CanceledTaskListView extends GetView<CanceledTaskListController> {
  const CanceledTaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CanceledTaskListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CanceledTaskListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
