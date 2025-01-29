import 'package:get/get.dart';

import '../controllers/add_new_task_screen_controller.dart';

class AddNewTaskScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewTaskScreenController>(
      () => AddNewTaskScreenController(),
    );
  }
}
