import 'package:flutter/material.dart';
import 'package:gadacts/Models/user_model.dart';
import 'package:gadacts/Screens/profile/avatar.dart';
import 'package:gadacts/Screens/splash.dart';
import 'package:gadacts/controller/user_controller.dart';
import 'package:gadacts/firebase_helper/auth.dart';
import 'package:gadacts/services.dart/locator.dart';

class SideDrawer extends StatelessWidget {


  UserModel currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CircleAvatar(
              radius: 40,
              child: Avatar(
                avatarUrl: currentUser?.avatarUrl,
              )),
          Text("${currentUser?.displayName ?? 'login'}",
              style: TextStyle(
                  fontSize: 20, color: Colors.black.withOpacity(0.5))),
        ]),
      ),
      Divider(),
      ListTile(
        title: Text(
          'Dark Mode',
          style: TextStyle(fontSize: 17),
        ),
      ),
      ListTile(
          title: Text(
            'Sign Out',
            style: TextStyle(fontSize: 17),
          ),
          onTap: () {
            locator.get<Auth>().signOut();
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Splash()));
          })
    ]);
  }
}
