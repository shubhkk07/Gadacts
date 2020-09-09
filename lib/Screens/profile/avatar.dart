import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final Function onTap;
  Avatar({this.avatarUrl, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
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
