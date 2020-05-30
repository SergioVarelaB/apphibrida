import 'package:apphibridatrabajos/src/login_page.dart';
import 'package:flutter/material.dart';

import '../detail_page.dart';
import '../main.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomeWidget(),
    'principal': (BuildContext context) => DetailPage(),
  };
}
