import 'package:flutter/material.dart';
import 'package:gadacts/Models/user_model.dart';
import 'package:gadacts/Screens/profile/avatar.dart';
import 'package:gadacts/Screens/splash.dart';
import 'package:gadacts/controller/user_controller.dart';
import 'package:gadacts/services.dart/locator.dart';
import '../firebase_helper/auth.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  UserModel currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Row(children: [
              Avatar(
                avatarUrl: currentUser?.avatarUrl,
              ),
              Padding(padding: EdgeInsets.only(left:20),
              child: Text("${currentUser?.displayName?? null}"),
              )
            ]),
          ),
        ),
        RaisedButton(
            onPressed: () {
              locator.get<Auth>().signOut();
              setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Splash()));
              });
            },
            child: Text('sign out')),
      ]),
    );
  }
}
