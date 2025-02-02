import 'package:get/get.dart';

import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/delete_task_controller.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/update_task_controller.dart';

import '../controllers/new_task_list_controller.dart';

class NewTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteTaskController>(
      () => DeleteTaskController(),
    );
    Get.lazyPut<UpdateTaskController>(
      () => UpdateTaskController(),
    );
    Get.lazyPut<NewTaskListController>(
      () => NewTaskListController(),
    );
  }
}
