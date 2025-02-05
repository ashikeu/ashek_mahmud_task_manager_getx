import 'package:ashek_task_manager_getx/app/models/task_model.dart';
import 'package:ashek_task_manager_getx/app/modules/canceled_task_list/controllers/canceled_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/completed_task_list/controllers/completed_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/delete_task_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/new_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/update_task_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/progress_task_list/controllers/progress_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/status_enum.dart';
import 'package:ashek_task_manager_getx/app/widgets/change_task_status_dialog.dart';
import 'package:ashek_task_manager_getx/app/widgets/delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskItemWidget extends StatelessWidget {
  TaskItemWidget({
    super.key,
    required this.taskModel,
    required this.taskModelList,
    required this.index,
  });

  final int index;
  final TaskModel taskModel;
  final List<TaskModel> taskModelList;
  // final DeleteTaskController deleteTaskController=Get.find<DeleteTaskController>();
  // final UpdateTaskController updateTaskController=Get.find<UpdateTaskController>();
  final DeleteTaskController deleteTaskController =
      Get.put(DeleteTaskController());
  final UpdateTaskController updateTaskController =
      Get.put(UpdateTaskController());
  // NewTaskListController newTaskListController = Get.put(NewTaskListController());
  // ProgressTaskListController progressTaskListController = Get.put(ProgressTaskListController());
  // CompletedTaskListController completedTaskListController = Get.put(CompletedTaskListController());

  NewTaskListController newTaskListController =
      Get.find<NewTaskListController>();
  ProgressTaskListController progressTaskListController =
      Get.find<ProgressTaskListController>();
  CompletedTaskListController completedTaskListController =
      Get.find<CompletedTaskListController>();
  CanceledTaskListController canceledTaskListController =
      Get.find<CanceledTaskListController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text('Date: ${taskModel.createdDate ?? ''}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _getStatusColor(
                        taskModel.status ?? enumTaskStatus.NewTask.name),
                  ),
                  child: Text(
                    taskModel.status ?? enumTaskStatus.NewTask.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        bool isConfirmed = await ConfirmationDialog
                            .showDeleteConfirmationDialog(context);
                        if (isConfirmed) {
                          _deleteTask(taskModel.sId!);
                          // taskModelList.remove(taskModel);
                          // Navigator.pushReplacementNamed(
                          //     context, MainBottomNavScreen.name);
                        }
                      },
                       icon: const Icon(Icons.delete,color: Colors.red,),

                    ),
                    IconButton(
                      onPressed: () async {
                        enumTaskStatus taskStatus =
                            await ChangeStatusDialog.showChangeStatusDialog(
                                context);
                        if (taskStatus.name != enumTaskStatus.none.name) {
                          _updateTask(taskStatus.name, taskModel.sId!);
                        }
                      },
                      icon: const Icon(Icons.edit,color: Colors.blue,),

                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == enumTaskStatus.NewTask.name) {
      return Colors.blue;
    } else if (status == enumTaskStatus.Progress.name) {
      return Colors.purple;
    } else if (status == enumTaskStatus.Canceled.name) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Future<void> _deleteTask(String sid) async {
    bool isSuccess = await deleteTaskController.deleteTask(sid);
    if (isSuccess) {
      Get.snackbar("Success", "Task deleted successfully.",
          backgroundColor: Colors.amberAccent);
      refreshTaskList(taskModel.status!);
    } else {
      Get.snackbar("Error", deleteTaskController.errorMessage!,
          colorText: Colors.red);
    }
  }

  Future<void> _updateTask(String status, String sid) async {
    bool isSuccess = await updateTaskController.updateTask(status, sid);
    if (isSuccess) {
      Get.snackbar("Success", "Task status updated successfully.",
          backgroundColor: Colors.amberAccent);
      refreshTaskList(taskModel.status!);
      refreshTaskList(status);
    } else {
      Get.snackbar("Error", deleteTaskController.errorMessage!,
          colorText: Colors.red);
    }
  }

  void refreshTaskList(String status) {
    newTaskListController.refreshListCount();
    if (enumTaskStatus.NewTask.name == status) {
      newTaskListController.refreshList();
    } else if (enumTaskStatus.Completed.name == status) {
      completedTaskListController.refreshList();
    } else if (enumTaskStatus.Progress.name == status) {
      progressTaskListController.refreshList();
    } else if (enumTaskStatus.Canceled.name == status) {
      canceledTaskListController.refreshList();
    }
  }
}
