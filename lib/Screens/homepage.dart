import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../firebase_helper/auth.dart';
import '../firebase_helper/storage.dart' as fbStorage;

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _location;

  final Auth auth = Auth();

  void _upload() async{
    Directory systemTempDir = Directory.systemTemp;
    File file = await File('${systemTempDir.path}/foo.txt').create();
    await file.writeAsString('hello world');
    String location = await fbStorage.upload(file, basename(file.path));
    setState((){
       _location = location;
    });
    
  }

  void _download()async{
    Uri location = Uri.parse(_location);
    String data = await fbStorage.download(location);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(onPressed:_upload,child:Text('upload')),
            RaisedButton(onPressed: _download,child:Text('download')),
          ],
        )
      ),
    );
  }
}