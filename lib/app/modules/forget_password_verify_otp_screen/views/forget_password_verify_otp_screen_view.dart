import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_verify_otp_screen_controller.dart';

class ForgetPasswordVerifyOtpScreenView
    extends GetView<ForgetPasswordVerifyOtpScreenController> {
  const ForgetPasswordVerifyOtpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordVerifyOtpScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordVerifyOtpScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
