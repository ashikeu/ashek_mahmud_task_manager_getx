import 'dart:convert';

import 'package:ashek_task_manager_getx/app/modules/canceled_task_list/views/canceled_task_list_view.dart';
import 'package:ashek_task_manager_getx/app/modules/completed_task_list/views/completed_task_list_view.dart';
import 'package:ashek_task_manager_getx/app/modules/new_task_list/views/new_task_list_view.dart';
import 'package:ashek_task_manager_getx/app/modules/progress_task_list/views/progress_task_list_view.dart';
import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: SafeArea(
            child: AppBar(
              // title: const Text('Task Manager'),
              // toolbarHeight: 80,
              backgroundColor: AppColors.themeColor,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: MemoryImage(
                      base64Decode(AuthController.userModel?.photo ?? ''),
                    ),
                    onBackgroundImageError: (_, __) =>
                        const Icon(Icons.person_outline),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // if (!fromUpdateProfile) {
                        //   Navigator.pushNamed(context, UpdateProfileScreen.name);
                        // }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AuthController.userModel?.fullName ?? '',
                            style: textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            AuthController.userModel?.email ?? '',
                            style: textTheme.bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await AuthController.clearUserData();
                      Get.offNamed(Routes.SIGN_IN_SCREEN);
                    },
                    icon: const Icon(Icons.logout),
                  )
                ],
              ),

              bottom: TabBar(
                // indicator: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50), // Creates border
                //     color: Colors.greenAccent), //Change background color from here
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white, // Unselected tab text color
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    icon: Icon(Icons.new_label_outlined,color: Colors.white),
                    text: 'New Task',
                  ),
                  Tab(
                    icon: Icon(Icons.refresh,color: Colors.white),
                    text: 'InProgress',
                  ),
                  Tab(
                    icon: Icon(Icons.done,color: Colors.white),
                    text: 'Completed',
                  ),
                  Tab(
                    icon: Icon(Icons.cancel_outlined,color: Colors.white),
                    text: 'Canceled',
                    
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            NewTaskListView(),
            ProgressTaskListView(),
            CompletedTaskListView(),
            CanceledTaskListView()
          ]),
        ),
      ),
    );
  }
}
