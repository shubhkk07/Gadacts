import 'package:gadacts/Models/user_model.dart';
import 'package:gadacts/firebase_helper/auth.dart';
import 'package:gadacts/services.dart/locator.dart';

class UserController{
  UserModel _currentUser;
  Future init;

  UserController(){
    init = initUser();
  }

  Future<UserModel> initUser() async{
    _currentUser = await locator.get<Auth>().getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;
}