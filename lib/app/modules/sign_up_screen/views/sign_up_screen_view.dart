import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignUpScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
