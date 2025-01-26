import 'package:get/get.dart';
import '../controllers/new_task_list_controller.dart';

class NewTaskListBinding extends Bindings {
  @override
  void dependencies() {    
    Get.lazyPut<NewTaskListController>(
      () => NewTaskListController(),
    );
  }
}
