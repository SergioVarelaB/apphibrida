import 'package:flutter/material.dart';

import '../detail_page.dart';
import '../main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Center(
                    child: new Image.asset('assets/images/login_bg.png',
                      height: 400,
                      width: MediaQuery.of(context).size.width ,
                      fit: BoxFit.fill,)
                ),
                Center(
                  child: Text("Sweeping",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        height: 7.0,
                        color: Colors.black54),),
                ),
                Center(
                  child: Text("La app donde tu decides donde trabajar",
                    style: TextStyle(
                        fontSize: 15.0,
                        height: 25.0,
                        color: Colors.black),),
                ),
              ],
            ),
          ),
          // googleButton,
          FlatButton(
            color: Colors.red,

            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomeWidget()),
              );
            },
            splashColor: Colors.red,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/google_icon.png'),
                  Text(
                    'Conectar con Google',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),

          // facebookButton, TODO: COMVERTIR LOS BOTONES ASI
          /** FACCEBOOK */
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomeWidget()),
              );
            },
            splashColor: Colors.blue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/facebook_icon.png'),
                  Text(
                    'Conectar con Facebook',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          /** TERMINA EL BUTTON */
        ],
      ),
    );
  }

  Widget facebookButton = FlatButton(
    color: Colors.blue,
    onPressed: () {},
    splashColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/facebook_icon.png'),
          Text(
            'Conectar con Faceboasdoka',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );

  Widget googleButton = FlatButton(
    color: Colors.red,
    onPressed: () {},
    splashColor: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/google_icon.png'),
          Text(
            'Conectar con Google',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}