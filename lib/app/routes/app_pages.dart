import 'package:get/get.dart';

import '../modules/add_new_task_screen/bindings/add_new_task_screen_binding.dart';
import '../modules/add_new_task_screen/views/add_new_task_screen_view.dart';
import '../modules/canceled_task_list/bindings/canceled_task_list_binding.dart';
import '../modules/canceled_task_list/views/canceled_task_list_view.dart';
import '../modules/completed_task_list/bindings/completed_task_list_binding.dart';
import '../modules/completed_task_list/views/completed_task_list_view.dart';
import '../modules/forget_password_verify_email_screen/bindings/forget_password_verify_email_screen_binding.dart';
import '../modules/forget_password_verify_email_screen/views/forget_password_verify_email_screen_view.dart';
import '../modules/forget_password_verify_otp_screen/bindings/forget_password_verify_otp_screen_binding.dart';
import '../modules/forget_password_verify_otp_screen/views/forget_password_verify_otp_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_task_list/bindings/new_task_list_binding.dart';
import '../modules/new_task_list/views/new_task_list_view.dart';
import '../modules/progress_task_list/bindings/progress_task_list_binding.dart';
import '../modules/progress_task_list/views/progress_task_list_view.dart';
import '../modules/reset_password_screen/bindings/reset_password_screen_binding.dart';
import '../modules/reset_password_screen/views/reset_password_screen_view.dart';
import '../modules/sign_in_screen/bindings/sign_in_screen_binding.dart';
import '../modules/sign_in_screen/views/sign_in_screen_view.dart';
import '../modules/sign_up_screen/bindings/sign_up_screen_binding.dart';
import '../modules/sign_up_screen/views/sign_up_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/update_profile_screen/bindings/update_profile_screen_binding.dart';
import '../modules/update_profile_screen/views/update_profile_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEW_TASK_LIST,
      page: () => NewTaskListView(),
      binding: NewTaskListBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS_TASK_LIST,
      page: () => ProgressTaskListView(),
      binding: ProgressTaskListBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED_TASK_LIST,
      page: () => const CompletedTaskListView(),
      binding: CompletedTaskListBinding(),
    ),
    GetPage(
      name: _Paths.CANCELED_TASK_LIST,
      page: () => const CanceledTaskListView(),
      binding: CanceledTaskListBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_SCREEN,
      page: () => SignInScreenView(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => const SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD_VERIFY_EMAIL_SCREEN,
      page: () => const ForgetPasswordVerifyEmailScreenView(),
      binding: ForgetPasswordVerifyEmailScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD_VERIFY_OTP_SCREEN,
      page: () => const ForgetPasswordVerifyOtpScreenView(),
      binding: ForgetPasswordVerifyOtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_SCREEN,
      page: () => const ResetPasswordScreenView(),
      binding: ResetPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_TASK_SCREEN,
      page: () => const AddNewTaskScreenView(),
      binding: AddNewTaskScreenBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE_SCREEN,
      page: () => const UpdateProfileScreenView(),
      binding: UpdateProfileScreenBinding(),
    ),
  ];
}
