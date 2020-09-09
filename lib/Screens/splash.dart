import 'package:flutter/material.dart';
import 'package:gadacts/Screens/Bottombar.dart';

import 'package:gadacts/firebase_helper/auth.dart';
import 'package:gadacts/services.dart/locator.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100,
            ),
            RaisedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  await locator.get<Auth>().signInwithGoogle().whenComplete(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomBar()));
                  });
                })
          ],
        ),
      ),
    );
  }
}
