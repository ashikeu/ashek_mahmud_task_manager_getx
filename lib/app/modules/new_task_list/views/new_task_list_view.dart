import 'package:ashek_task_manager_getx/app/models/task_count_model.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/new_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:ashek_task_manager_getx/app/widgets/task_item_widget.dart';
import 'package:ashek_task_manager_getx/app/widgets/task_status_summary_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskListView extends StatelessWidget {
  NewTaskListView({super.key});

  final NewTaskListController controller = Get.put(NewTaskListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTasksSummaryByStatus(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Obx(
                  () => Visibility(
                      visible: (controller.isLoading.value == false),
                      replacement: const CenteredCircularProgressIndicator(),
                      child: _buildTaskListView()),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, AddNewTaskScreen.name);
          Get.toNamed(Routes.ADD_NEW_TASK_SCREEN);
        },
        child: const Icon(Icons.add),
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

  Widget _buildTasksSummaryByStatus() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.taskCountByStatusModel.value.taskByStatusList.length,
            itemBuilder: (context, index) {
              final TaskCountModel model = controller
                  .taskCountByStatusModel.value.taskByStatusList[index];
              return TaskStatusSummaryCounterWidget(
                title: model.sId ?? '',
                count: model.sum.toString(),
              );
            },
          ),
        ),
      ),
    );
  }
}
