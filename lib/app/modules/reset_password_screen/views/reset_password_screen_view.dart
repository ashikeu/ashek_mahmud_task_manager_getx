import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:ashek_task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:ashek_task_manager_getx/app/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreenView extends GetView<ResetPasswordScreenController> {
   ResetPasswordScreenView({super.key});
  
  @override
  final ResetPasswordScreenController controller=Get.put(ResetPasswordScreenController());
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
                  Text('Set Password', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Minimum length of password should be more than 8 letters.',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.newPasswordTEController,
                    decoration: const InputDecoration(hintText: 'New Password'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.confirmPasswordTEController,
                    decoration:
                        const InputDecoration(hintText: 'Confirm New Password'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                     visible: controller.isLoading.value == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async{
                        if(_validatePasswords())
                        {
                        if(await controller.resetPassword())
                          {
                            Get.offNamedUntil(Routes.SIGN_IN_SCREEN, (route)=>false);
                          // Navigator.pushNamedAndRemoveUntil(
                          //     TaskManagerApp.navigatorKey.currentContext!, SignInScreen.name, (value) => false);
                          }
                        }
                        else
                        {
                          Get.snackbar("Password Mismatch", 'Password didn''t match.');
                        }
                      },
                      child: const Text('Confirm'),
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
bool _validatePasswords() {
   
      // If passwords do not match, set error message
      if (controller.newPasswordTEController.text != controller.confirmPasswordTEController.text) {
        return false;
      } else {
        return true;
      }   
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
              ..onTap = () async{           
                Get.offNamedUntil(Routes.SIGN_IN_SCREEN,(route) => false);    
                // Navigator.pushNamedAndRemoveUntil(
                //     context, SignInScreen.name, (value) => false);
                
              },
          )
        ],
      ),
    );
  }

 
}
