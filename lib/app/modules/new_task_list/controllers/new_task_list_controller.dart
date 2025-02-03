import 'package:ashek_task_manager_getx/app/models/task_count_by_status_model.dart';
import 'package:ashek_task_manager_getx/app/models/task_list_by_status_model.dart';
import 'package:ashek_task_manager_getx/app/models/task_model.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/status_enum.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:get/get.dart';

class NewTaskListController extends GetxController {

  var isLoading = false.obs;
  Rx<TaskCountByStatusModel> taskCountByStatusModel = TaskCountByStatusModel().obs;
  Rx<TaskListByStatusModel> newTaskListModel = TaskListByStatusModel().obs;
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    _getTaskCountByStatus();
    _getNewTaskList(); 
  }

  Future<void> _getTaskCountByStatus() async {
    isLoading.value = true;
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskCountByStatusUrl);
    if (response.isSuccess) {
      taskCountByStatusModel.value =
          TaskCountByStatusModel.fromJson(response.responseData!);
    } else {
      Get.snackbar("Msg", response.errorMessage);
    }
    isLoading.value = false;
  }

  Future<void> _getNewTaskList() async {
    isLoading.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskListByStatusUrl(enumTaskStatus.NewTask.name));
    if (response.isSuccess) {
      newTaskListModel.value = TaskListByStatusModel.fromJson(response.responseData!);
      //refresh list

      taskList.value = newTaskListModel.value.taskList;
      taskList.refresh();
    } else {
      Get.snackbar("Msg", response.errorMessage);
    }
   isLoading.value = false;
  }

}
