import 'package:apphibrida/src/login_page.dart';
import 'package:flutter/material.dart';
import 'package:apphibrida/src/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweeping',
      initialRoute:
          'login', //TODO: Una vez que carge la app darle guardar y recargar
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'principal': (BuildContext context) => DetailPage(),
      },
    );
  }
}
