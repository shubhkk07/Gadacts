import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  
  Avatar({this.avatarUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
        child: avatarUrl == null
            ? CircleAvatar(
                radius: 50,
                child: Icon(Icons.account_circle),
              )
            : CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarUrl),
              ));
  }
}
