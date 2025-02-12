import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:ashek_task_manager_getx/app/widgets/task_item_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/canceled_task_list_controller.dart';

class CanceledTaskListView extends GetView<CanceledTaskListController> {
   CanceledTaskListView({super.key});
  @override
  final CanceledTaskListController controller =
      Get.put(CanceledTaskListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => Visibility(
                        visible: controller.isLoading.value == false,
                        replacement: const CenteredCircularProgressIndicator(),
                        child: _buildTaskListView()),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: controller.newTaskListModel.value.taskList.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: controller.newTaskListModel.value.taskList[index],
          taskModelList: controller.newTaskListModel.value.taskList,
          index: index,
        );
      },   
    );
  }
}
