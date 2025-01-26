import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreenView extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPasswordScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetPasswordScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
