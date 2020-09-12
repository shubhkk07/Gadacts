import 'package:flutter/material.dart';
import 'package:gadacts/Screens/Bottombar.dart';
import 'package:gadacts/Screens/splash.dart';
import 'package:gadacts/controller/user_controller.dart';
import 'package:gadacts/services.dart/locator.dart';

class EnsureLoggedIn extends StatelessWidget {

  Future moveToRightPage()async{
     if (locator.get<UserController>().currentUser == null){
      return Splash();
    }
    else{
      return BottomBar();
    }
  }
  @override
  Widget build(BuildContext context) {
    if (locator.get<UserController>().currentUser == null){
      return Splash();
    }
    else{
      return BottomBar();
    }
  }
}