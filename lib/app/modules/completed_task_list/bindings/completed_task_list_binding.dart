import 'package:get/get.dart';

import '../controllers/completed_task_list_controller.dart';

class CompletedTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedTaskListController>(
      () => CompletedTaskListController(),
    );
  }
}
