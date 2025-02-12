import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:ashek_task_manager_getx/app/models/user_model.dart';
import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreenController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  var isLoading = false.obs;
  RxString profileImageName = "".obs;
  Rx<File> profileImageFile = File("").obs;
  Rx<Uint8List> profileImage = Uint8List(0).obs;
  RxString imageChooseText = "Choose Profile Image".obs;

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

    if (profileImage.value.isNotEmpty) {
      requestBody['photo'] =base64Encode(profileImage.value) ;
    }
    if (passwordTEController.text.isNotEmpty) {
      requestBody['password'] = passwordTEController.text;
    }

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.updateProfile, body: requestBody);
    isLoading.value = false;
    if (response.isSuccess) {
      passwordTEController.clear();
      UserModel? userModel=AuthController.userModel;
      if(userModel!=null)
      {
        userModel.photo=base64Encode(profileImage.value);
        await AuthController.saveUserData(AuthController.accessToken!, userModel);
      }
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final imageName = File(pickedFile.name);
      final originalImageData = await imageFile.readAsBytes();

      final compressedImageData = await FlutterImageCompress.compressWithList(
        originalImageData,
        minWidth: 50,
        minHeight: 50,
        quality: 50,
      );
      profileImageName.value = imageName.path.toString();
      profileImageFile.value = imageFile;
      profileImage.value = compressedImageData;

      imageChooseText.value = "Change Cover Image";
    }
  }

  @override
  void onClose() {
    emailTEController.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    mobileTEController.dispose();
    passwordTEController.dispose();
    profileImageName.value ="";
    super.onClose();
  }
}
