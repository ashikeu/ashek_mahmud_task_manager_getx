import 'package:ashek_task_manager_getx/app/models/task_model.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/delete_task_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/new_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/update_task_controller.dart';
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
  final DeleteTaskController deleteTaskController = Get.put(DeleteTaskController());
  final UpdateTaskController updateTaskController = Get.put(UpdateTaskController());
  NewTaskListController newTaskListController = Get.put(NewTaskListController());

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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _getStatusColor(taskModel.status ?? enumTaskStatus.NewTask.name),
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
                        bool isConfirmed = await ConfirmationDialog.showDeleteConfirmationDialog(context);
                        if (isConfirmed) {
                          _deleteTask(taskModel.sId!);
                          // taskModelList.remove(taskModel);
                          // Navigator.pushReplacementNamed(
                          //     context, MainBottomNavScreen.name);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () async {
                        enumTaskStatus taskStatus = await ChangeStatusDialog.showChangeStatusDialog(context);
                        if (taskStatus.name != taskModel.status) {
                          _updateTask(taskStatus.name, taskModel.sId!);
                          taskModelList[index] = taskModel;
                          // Navigator.pushReplacementNamed(
                          //     context, MainBottomNavScreen.name);
                        }
                      },
                      icon: const Icon(Icons.edit),
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
      //refresh list
      newTaskListController.taskList.removeAt(index);
      newTaskListController.taskList.refresh();
      Get.snackbar("Success", "Task deleted successfully.");
    } else {
      Get.snackbar("Error", deleteTaskController.errorMessage!);
    }
  }

  Future<void> _updateTask(String status, String sid) async {
    bool isSuccess = await updateTaskController.updateTask(status, sid);

    if (isSuccess) {
      Get.snackbar("Success", "Task status updated successfully.");
    } else {
      Get.snackbar("Error", deleteTaskController.errorMessage!);
    }
  }
}
