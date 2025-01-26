import 'package:get/get.dart';

import '../controllers/progress_task_list_controller.dart';

class ProgressTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressTaskListController>(
      () => ProgressTaskListController(),
    );
  }
}
