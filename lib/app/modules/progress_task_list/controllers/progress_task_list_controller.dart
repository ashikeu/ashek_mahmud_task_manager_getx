import 'package:ashek_task_manager_getx/app/models/task_list_by_status_model.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/status_enum.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:get/get.dart';

class ProgressTaskListController extends GetxController {
   var isLoading = false.obs;
  Rx<TaskListByStatusModel> newTaskListModel = TaskListByStatusModel().obs;
  @override
  void onInit() {
    super.onInit();
    _getTaskList();
  }
void refreshList()
{
  _getTaskList();
}

  Future<void> _getTaskList() async {
    isLoading.value = true;
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskListByStatusUrl(enumTaskStatus.Progress.name));
    if (response.isSuccess) {
      newTaskListModel.value = TaskListByStatusModel.fromJson(response.responseData!);
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
   isLoading.value = false;
  }
}
