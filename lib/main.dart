import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gadacts/ensure_user.dart';
import 'package:gadacts/services.dart/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
  ));

  setupServices();
  runApp(Gadacts());
}

class Gadacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnsureLoggedIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
