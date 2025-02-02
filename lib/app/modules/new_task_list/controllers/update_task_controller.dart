import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:get/get.dart';

class UpdateTaskController extends GetxController {
  var isLoading = false.obs;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> updateTask(String status,String sid) async {
    isLoading.value=true;
    bool isSuccess=false;
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.updateTaskStatusUrl(sid,status));
    if (response.isSuccess) {
      isSuccess=true;
    } else {
      _errorMessage= response.errorMessage;
    }
    return isSuccess;
  }
}
