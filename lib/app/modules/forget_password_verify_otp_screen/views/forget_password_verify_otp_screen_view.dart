import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/forget_password_verify_otp_screen_controller.dart';

class ForgetPasswordVerifyOtpScreenView
    extends GetView<ForgetPasswordVerifyOtpScreenController> {
   ForgetPasswordVerifyOtpScreenView({super.key});
 @override
  final ForgetPasswordVerifyOtpScreenController controller=Get.put(ForgetPasswordVerifyOtpScreenController());
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
                  Text('PIN Verification', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'A 6 digits of OTP has been sent to your email address',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  _buildPinCodeTextField(),
                  const SizedBox(height: 24),
                  Visibility(
                     visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async{
                        AuthController.userOTP=controller.otpTEController.text;
                         if(await controller.verifyOTP())
                        {                     
                          Get.toNamed(Routes.RESET_PASSWORD_SCREEN)   ;
                        // Navigator.pushNamed(
                        //     TaskManagerApp.navigatorKey.currentContext!, ResetPasswordScreen.name);
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

  Widget _buildPinCodeTextField() {
    //focusNode.requestFocus();
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),       
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: controller.otpTEController,
      appContext: Get.context!,
      // focusNode:focusNode
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
                Get.offNamedUntil(Routes.SIGN_IN_SCREEN, (route) => false);
                // Navigator.pushNamedAndRemoveUntil(
                //     context, SignInScreen.name, (value) => false);
              },
          )
        ],
      ),
    );
  }

  
}
