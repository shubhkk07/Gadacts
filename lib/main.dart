import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gadacts/Screens/splash.dart';
import 'package:gadacts/ensure_user.dart';
import 'package:gadacts/services.dart/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
      options: FirebaseOptions(
          appId: "1:1006483941278:android:d82b6d390049fcfe71988f",
          messagingSenderId: "1006483941278",
          apiKey: "AIzaSyBSCz77EuyX_oe8RhrKEumF73k9zIvESCE",
          projectId: "gadacts-5638f"));

  final FirebaseStorage storage = FirebaseStorage(
      app: app, storageBucket: "gs://gadacts-5638f.appspot.com");

  setupServices();
  runApp(Gadacts(
    storage: storage,
  ));
}

class Gadacts extends StatelessWidget {
  final FirebaseStorage storage;
  Gadacts({this.storage});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnsureLoggedIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
