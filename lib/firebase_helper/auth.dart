import 'package:firebase_auth/firebase_auth.dart';

import 'package:gadacts/Models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Auth {

  final FirebaseAuth auth =FirebaseAuth.instance;


   Future<UserModel> getUser() async{
     var currUser = auth.currentUser;
     return UserModel(currUser.uid,displayName:currUser.displayName,avatarUrl: currUser.photoURL);
   }
  

  Future signInwithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final User user = (await auth.signInWithCredential(credential)).user;
    return user;
  }
 

  void signOut() async {
    return await FirebaseAuth.instance.signOut(); 
  }
}
