import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_verify_email_screen_controller.dart';

class ForgetPasswordVerifyEmailScreenView
    extends GetView<ForgetPasswordVerifyEmailScreenController> {
  const ForgetPasswordVerifyEmailScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordVerifyEmailScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordVerifyEmailScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
