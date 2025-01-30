import 'dart:convert';
import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreenController extends GetxController {

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  late XFile? pickedImage;
  var isLoading=false.obs;

  @override
  void onInit() {
    emailTEController.text = AuthController.userModel?.email ?? '';
    firstNameTEController.text = AuthController.userModel?.firstName ?? '';
    lastNameTEController.text = AuthController.userModel?.lastName ?? '';
    mobileTEController.text = AuthController.userModel?.mobile ?? '';
    super.onInit();
  }

   
  
  Future<void> updateProfile() async {
    isLoading.value = true;
    Map<String, dynamic> requestBody = {
      "email": emailTEController.text.trim(),
      "firstName": firstNameTEController.text.trim(),
      "lastName": lastNameTEController.text.trim(),
      "mobile": mobileTEController.text.trim(),
    };

    if (pickedImage != null) {
      List<int> imageBytes = await pickedImage!.readAsBytes();
      requestBody['photo'] = base64Encode(imageBytes);
    }
    if (passwordTEController.text.isNotEmpty) {
      requestBody['password'] = passwordTEController.text;
    }

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.updateProfile, body: requestBody);
    isLoading.value = false;
    if (response.isSuccess) {
      passwordTEController.clear();
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  @override
  void onClose() {
    emailTEController.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    mobileTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }

}
