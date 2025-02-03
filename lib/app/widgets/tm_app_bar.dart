import 'dart:convert';

import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.fromUpdateProfile = false,
  });

  final bool fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: MemoryImage(
              base64Decode(AuthController.userModel?.photo ?? ''),
            ),
            onBackgroundImageError: (_, __) => const Icon(Icons.person_outline),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!fromUpdateProfile) {
                  // Navigator.pushNamed(context, UpdateProfileScreen.name);
                  Get.toNamed(Routes.UPDATE_PROFILE_SCREEN);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fullName ?? '',
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    AuthController.userModel?.email ?? '',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              await AuthController.clearUserData();
              // Navigator.pushNamedAndRemoveUntil(
              //     context, SignInScreen.name, (predicate) => false);
              Get.offAllNamed(Routes.SIGN_IN_SCREEN);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
