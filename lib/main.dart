import 'package:flutter/material.dart';
import 'package:apphibridatrabajos/bottom_bar/fancy_bottom_bar.dart';
import 'package:apphibridatrabajos/jobs_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweeping',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: new HomeWidget(),
    );
  }

}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedPos = 2;


  final tabItems = [
    FancyBottomItem(title: Text("Home"), icon: Icon(Icons.home), content: Column(children: <Widget>[Center(child: Text('tab 1'))])),
    FancyBottomItem(
        title: Text("Buscar"),
        icon: Icon(Icons.search),
        content: Column(children: <Widget>[Center(child: Text('Mapa'))])
    ),
    FancyBottomItem(title: Text("Profile"),
        icon: Icon(Icons.person),
        content: JobsPage()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: FancyBottomBar(
        height: 50,
        onItemSelected: (i) => setState(() => selectedPos = i),
        items: tabItems,
        selectedPosition: selectedPos,
        selectedColor: Colors.amber,
        indicatorColor: Colors.deepPurple,
      ),
      body: Container(

        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tabItems[selectedPos].content

          ],
        ),
      ),
    );
  }
}
