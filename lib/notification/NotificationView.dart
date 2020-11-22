import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'PushNotificationService.dart';

class NotifcationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    final pushNotificationService = PushNotificationService(_firebaseMessaging);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Initialise"),
          onPressed: () {
            _showNotification();
            // pushNotificationService.initialise();
          },
        ),
      ),
    );
  }

  _showNotification() {
    showSimpleNotification(
      Text("this is a message from simple notification"),
      background: Colors.green,
      slideDismiss: true,
    );

    toast("Hello world", duration: Duration(seconds: 3));

  }
}
