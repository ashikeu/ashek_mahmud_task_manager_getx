import 'package:get/get.dart';

import '../controllers/canceled_task_list_controller.dart';

class CanceledTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CanceledTaskListController>(
      () => CanceledTaskListController(),
    );
  }
}
