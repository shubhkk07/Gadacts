import 'package:gadacts/controller/user_controller.dart';
import 'package:gadacts/firebase_helper/auth.dart';
import 'package:gadacts/firebase_helper/database.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices(){
  locator.registerSingleton<Auth>(Auth());
  locator.registerSingleton<UserController>(UserController());
  locator.registerSingleton<Database>(Database());
}
