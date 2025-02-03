
import 'package:ashek_task_manager_getx/app/utils/status_enum.dart';
import 'package:flutter/material.dart';

class ChangeStatusDialog {
static Future<enumTaskStatus> showChangeStatusDialog(BuildContext context) async {
 enumTaskStatus taskStatus=enumTaskStatus.none;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(enumTaskStatus.NewTask.name),
                onTap: ()  {
                  taskStatus= enumTaskStatus.NewTask;
                  Navigator.of(context).pop();
                },
              ),
              const Divider(height: 0),
              ListTile(
                title:  Text(enumTaskStatus.Progress.name),
                onTap: ()  {
                  taskStatus= enumTaskStatus.Progress;
                   Navigator.of(context).pop();
                },
              ),
              const Divider(height: 0),
              ListTile(
                title:  Text(enumTaskStatus.Completed.name),
                onTap: ()  {
                  taskStatus= enumTaskStatus.Completed;
                   Navigator.of(context).pop();
                },
              ),
              const Divider(height: 0),
              ListTile(
                title:  Text(enumTaskStatus.Canceled.name),
                onTap: ()  {
                  taskStatus= enumTaskStatus.Canceled;
                   Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
    return taskStatus;
  }
}