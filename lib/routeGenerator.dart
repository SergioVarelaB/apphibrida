import 'package:flutter/material.dart';
import 'package:apphibrida/main.dart';
import 'package:apphibrida/maps.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/maps':
        if(args is String){
          return MaterialPageRoute(builder: (_) => Maps(
            title: args,
          )
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}