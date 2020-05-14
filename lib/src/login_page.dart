import 'package:apphibrida/src/detail_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/login_bg.png',
          height: 400,
          width: MediaQuery.of(context).size.width ,
          fit: BoxFit.fill,),
          // googleButton,
          FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new DetailPage()),
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
                new MaterialPageRoute(builder: (context) => new DetailPage()),
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
                    'Conectar con Faceboasdoka',
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
