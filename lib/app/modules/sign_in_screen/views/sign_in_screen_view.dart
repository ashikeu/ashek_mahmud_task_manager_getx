import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_in_screen_controller.dart';

class SignInScreenView extends GetView<SignInScreenController> {
  SignInScreenView({super.key});
  // final TextEditingController _emailTEController = TextEditingController();
  // final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _signInProgress = false;
  @override
  final SignInScreenController controller=Get.put(SignInScreenController());

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
                  Text('Get Started With', style: textTheme.titleLarge),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid email address';
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
                        return 'Enter your valid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSignInButton,                     
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.FORGET_PASSWORD_VERIFY_EMAIL_SCREEN);
                          },
                          child: const Text('Forgot Password?'),
                        ),
                        _buildSignUpSection(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      controller.login();
    }
  } 

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: 'Sign up',
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(Routes.SIGN_UP_SCREEN);
              },
          )
        ],
      ),
    );
  }  
}
