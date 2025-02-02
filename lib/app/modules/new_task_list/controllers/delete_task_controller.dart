import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:get/get.dart';

class DeleteTaskController extends GetxController {
  var isLoading = false.obs;
  String? _errorMessage; 
  String? get errorMessage => _errorMessage;

  Future<bool> deleteTask(String sid) async {
    isLoading.value=true;
    bool isSuccess=false;
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.deleteTaskUrl(sid));
    if (response.isSuccess) {
      isSuccess=true;
    } else {
      _errorMessage= response.errorMessage;
    }
    return isSuccess;
  }
  
}
