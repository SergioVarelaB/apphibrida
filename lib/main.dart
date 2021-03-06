
import 'package:apphibridatrabajos/notifications_page.dart';
import 'package:apphibridatrabajos/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:apphibridatrabajos/bottom_bar/fancy_bottom_bar.dart';
import 'package:apphibridatrabajos/jobs_page.dart';
import 'package:flutter/cupertino.dart';
import 'maps.dart';
import 'models/user/profile.dart';
import 'models/user/roles.dart';
import 'models/user/user.dart';

List<Role> roles = List();
User user = User(userId: "5e7ce2971e765b0d83316268", displayName: "Alonso Salcido",
  profile: Profile(name: "Alonso", lastname: "Salcido",
      profileImg: "https://www.tonica.la/__export/1587317376975/sites/debate/img/2020/04/19/chrisevans-portadaefe.jpg_423682103.jpg",),
);

User getUser(){
  return user;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {

    user.profile.roles = roles;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweeping',
      initialRoute: '/',
      routes: getAplicationRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
//      home: new HomeWidget(),
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
    FancyBottomItem(
        title: Text("Home"), icon: Icon(Icons.home), content: Maps()),
    FancyBottomItem(
        title: Text("Buscar"),
        icon: Icon(Icons.search),
        content:
            Column(children: <Widget>[Center(child: Text('aqui va algo'))])),
    FancyBottomItem(
        title: Text("Profile"), icon: Icon(Icons.person), content: JobsPage()),
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
                  gradient: LinearGradient(
                      colors: <Color>[Colors.blueAccent, Colors.lightBlue])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                          backgroundImage: NetworkImage(user.profile.profileImg),
                      radius: 50,
                    ),
                    Text(
                      user.displayName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decorationThickness: 20),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Notificaciones'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationsPage())),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Mis trabajos'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedPos=2;
                });
              }
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
            children: <Widget>[tabItems[selectedPos].content],
        )
      ),
    );
  }

  @override
  void initState() {
    roles.add(Role(name:"Herrero"));
    roles.add(Role(name:"Cerrajero"));
    roles.add(Role(name:"Albañil"));
    roles.add(Role(name:"Barrendero"));
    getUser().profile.roles = roles;
    print("roles-->"+roles.toString());
  }
}
