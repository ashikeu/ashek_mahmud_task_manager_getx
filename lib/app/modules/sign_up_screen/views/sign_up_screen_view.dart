import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  SignUpScreenView({super.key});
 
 @override
  final SignUpScreenController controller=Get.put(SignUpScreenController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Join With Us', style: textTheme.titleLarge),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (!_isValidEmail(value!)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.firstNameTEController,
                    decoration: const InputDecoration(hintText: 'First name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.lastNameTEController,
                    decoration: const InputDecoration(hintText: 'Last name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.mobileTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your password';
                      }
                      if (value!.length < 6) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSignUpButton,
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: _buildSignInSection(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool _isValidEmail(String email) {
    // Regular expression for validating email
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      controller.registerUser();
    }
  }

  

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: 'Sign in',
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.back();
              },
          )
        ],
      ),
    );
  }

 
}
