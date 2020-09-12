import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  Future getPosts() async{
    QuerySnapshot qn = await FirebaseFirestore.instance .collection("Posts").get();
    return qn.docs;
  }
}
