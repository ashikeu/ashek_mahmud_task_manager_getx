
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/network_caller.dart';
import '../../../utils/status_enum.dart';
import '../../../utils/urls.dart';

class AddNewTaskScreenController extends GetxController {

  var isLoading = false.obs;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController =
  TextEditingController();
  Future<bool> createNewTask() async {
    bool isSuccess=false;
    isLoading.value = true;
    Map<String, dynamic> requestBody = {
      "title": titleTEController.text.trim(),
      "description": descriptionTEController.text.trim(),
      "status": enumTaskStatus.NewTask.name
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createTaskUrl, body: requestBody);
    isLoading.value = false;
    if (response.isSuccess) {
      _clearTextFields();
    } else {
      _errorMessage= response.errorMessage;
    }
    return isSuccess;
  }

  void _clearTextFields() {
    titleTEController.clear();
    descriptionTEController.clear();
  }

  @override
  void onClose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    super.onClose();
  }
}

