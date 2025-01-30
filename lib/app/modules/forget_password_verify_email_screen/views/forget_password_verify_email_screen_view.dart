import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/forget_password_verify_email_screen_controller.dart';

class ForgetPasswordVerifyEmailScreenView
    extends GetView<ForgetPasswordVerifyEmailScreenController> {
   ForgetPasswordVerifyEmailScreenView({super.key});
  @override
  final ForgetPasswordVerifyEmailScreenController controller =Get.put(ForgetPasswordVerifyEmailScreenController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
 
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
                  Text('Your Email Address', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'A 6 digits of OTP will be sent to your email address',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                     visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async{
                         AuthController.userEmail=controller.emailTEController.text;
                        if(await controller.verifyEmail())
                        {
                         Get.toNamed(Routes.FORGET_PASSWORD_VERIFY_OTP_SCREEN);
                        // Navigator.pushNamed(
                        //     TaskManagerApp.navigatorKey.currentContext!, ForgotPasswordVerifyOtpScreen.name);
                        }
                      },
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

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Have an account? ",
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
                // Navigator.pop(context);
                Get.back();
              },
          )
        ],
      ),
    );
  }

 
}
