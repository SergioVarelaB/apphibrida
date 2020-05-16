import 'package:apphibrida/routeGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "main",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sweeping"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Aqui va el login',
              style: TextStyle(fontSize: 30),
            ),
            RaisedButton(
              child: Text('Mapa'),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/maps',arguments: "id");
              },
            )
          ],
        ),
      ),
    );
  }

}
