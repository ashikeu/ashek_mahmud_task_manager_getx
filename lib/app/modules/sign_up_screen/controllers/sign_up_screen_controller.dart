import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
   var isLoading = false.obs;

  @override
  void onClose() {
     emailTEController.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    mobileTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }

  Future<void> registerUser() async {
    isLoading.value = true;
    Map<String, dynamic> requestBody = {
      "email": emailTEController.text.trim(),
      "firstName": firstNameTEController.text.trim(),
      "lastName":lastNameTEController.text.trim(),
      "mobile": mobileTEController.text.trim(),
      "password": passwordTEController.text,
      "photo": ""
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.registrationUrl, body: requestBody);
    isLoading.value = false;
    if (response.isSuccess) {
      _clearTextFields();
      Get.snackbar("Messege", 'New user registration successful!');
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  void _clearTextFields() {
    firstNameTEController.clear();
    lastNameTEController.clear();
    emailTEController.clear();
    passwordTEController.clear();
    mobileTEController.clear();
  }

}
