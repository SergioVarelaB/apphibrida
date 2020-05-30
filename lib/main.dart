import 'package:apphibridatrabajos/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:apphibridatrabajos/bottom_bar/fancy_bottom_bar.dart';
import 'package:apphibridatrabajos/jobs_page.dart';
import 'package:flutter/cupertino.dart';
import '_works/work.dart';
import 'maps.dart';

List<Work> worksActive = List<Work>();
List<Work> worksFinished = List<Work>();

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

  int selectedPos = 0;

  final tabItems = [
    FancyBottomItem(title: Text("Home"),
        icon: Icon(Icons.home),
        content: Maps()
    ),
    FancyBottomItem(
        title: Text("Buscar"),
        icon: Icon(Icons.search),
        content: Column(children: <Widget>[Center(child: Text('aqui va algo'))])
    ),
    FancyBottomItem(title: Text("Profile"),
        icon: Icon(Icons.person),
        content: JobsPage()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[Colors.blueAccent,Colors.lightBlue])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Image.asset('images/avatar.png', width: 100,height: 100,)
                    ),
                    Text(
                      "Nombre", style: TextStyle(color: Colors.white,fontSize: 15,decorationThickness: 20),
                    ),
                  ],
                ),
              ),

            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Notificaciones'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage())),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Mis trabajos'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Mi billetera'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
            ),
          ],
        ),
      ),
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