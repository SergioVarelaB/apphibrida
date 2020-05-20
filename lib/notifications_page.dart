import 'package:flutter/material.dart';

void main() => runApp(NotificationsPage());

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Center(
          child: Text('Aqui apareceran las notificaciones'),
        ),
      ),
    );
  }
}