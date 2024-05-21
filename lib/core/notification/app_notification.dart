import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notes/config/routes/app_routes.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/models/note.dart';

abstract class NotificationsConstants {
  static String channelName = "Schedule channel";
  static String channelKey = "Schedule key";
  static String channelDescription = "Schedule Notification channel";
}

class NotificationManager {
  static initializeNotifications() async {
    await AwesomeNotifications().initialize(
      "resource://drawable/notification",
      [
        NotificationChannel(
          channelKey: NotificationsConstants.channelKey,
          channelName: NotificationsConstants.channelName,
          channelDescription: NotificationsConstants.channelDescription,
          playSound: true,
          channelShowBadge: true,
          icon: "resource://drawable/notification",
          defaultPrivacy: NotificationPrivacy.Public,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          importance: NotificationImportance.High,
        ),
      ],
    );
  }

  static void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Notification Permission'),
          content:
              const Text('This app needs permission to send notifications.'),
          actions: [
            TextButton(
              child: const Text('Don\'t Allow'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text('Allow'),
              onPressed: () {
                AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) {
                  context.pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> checkNotificationPermission(BuildContext context) async {
    bool isAllow = false;
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      isAllow = isAllowed;
    });
    return isAllow;
  }

  static createNotification(BuildContext context,
      {required NotificationContent content,
      NotificationSchedule? schedule}) async {
    await checkNotificationPermission(context).then(
      (value) {
        if (value) {
          AwesomeNotifications()
              .createNotification(content: content, schedule: schedule);
        } else {
          _showPermissionDialog(context);
        }
      },
    );
  }

  static handleBackground() async {
    ReceivedAction? action = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
    if (action != null) {
      dynamic payload = action.payload;
      Note note = Note.fromMap(payload);
      AppRouter.navigatorKey.currentState?.pushReplacementNamed(Routes.noteRoute, arguments: note);
    }
  }

  static handleNotificationAction() async {
    await AwesomeNotifications().setListeners(
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod,
        onActionReceivedMethod: NotificationController.onActionReceivedMethod);
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {

  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    dynamic payload = receivedAction.payload;
    Note note = Note.fromMap(payload);
    AppRouter.navigatorKey.currentState
        ?.pushReplacementNamed(Routes.noteRoute, arguments: note);
  }
}
