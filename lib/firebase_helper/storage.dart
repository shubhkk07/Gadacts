import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';



Future<String> upload(File file, String basename) async {
  StorageReference ref =
      FirebaseStorage.instance.ref().child('file/test/{$basename}');
  ref.putFile(file);


  String location = await ref.getDownloadURL();

  String name = await ref.getName();
  String bucket = await ref.getBucket();
  String path = await ref.getPath();

  print('$name, $bucket,$path,$location');
 

  return location;
}

Future<String> download(Uri location) async {
  http.Response data = await http.get(location);

  return data.body;
}
