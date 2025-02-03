import 'package:ashek_task_manager_getx/app/modules/new_task_list/controllers/new_task_list_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/widgets/tm_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/centered_circular_progress_indicator.dart';
import '../../../widgets/screen_background.dart';
import '../controllers/add_new_task_screen_controller.dart';

class AddNewTaskScreenView extends GetView<AddNewTaskScreenController> {
  AddNewTaskScreenView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AddNewTaskScreenController controller=Get.find<AddNewTaskScreenController>();
  final NewTaskListController newTaskListController=Get.find<NewTaskListController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text('Add New Task', style: textTheme.titleLarge),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:controller.titleTEController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.descriptionTEController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your description here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(()=>
                  Visibility(
                    visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _createNewTask();
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createNewTask() async
  {
    bool isSuccess=await controller.createNewTask();
    if(isSuccess)
      {
        Get.snackbar("Success", 'New task added!');
        newTaskListController.refreshList();
        Get.toNamed(Routes.HOME);
      }
    else
      {
        Get.snackbar("Error", controller.errorMessage!);
      }
  }
  }
