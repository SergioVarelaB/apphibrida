import 'package:flutter/material.dart';

void main() => runApp(NotificationsPage());

class NotificationsPage extends StatelessWidget {
  final List<String> entries = <String>['Notificacion 1', 'Notificacion 2', 'Notificacion 3','Notificacion 4', 'Notificacion 5',
    'Notificacion 6','Notificacion 7', 'Notificacion 8', 'Notificacion 9','Notificacion 10', 'Notificacion 11', 'Notificacion 12'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notificaciones'),
        ),
        body: Center(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  height: 70,
                  color: Colors.white30,
                  child: Text('${entries[index]} '
                      ': Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla'
                      ' risus vitae sapien sodales, non pellentesque tortor tincidunt. Praesent facilisis.' ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ),
    );
  }
}