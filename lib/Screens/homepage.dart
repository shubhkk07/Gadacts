
//TODO:optimise the code and make different classes for container widget and Positioned wwidget


import 'package:flutter/material.dart';
import 'package:gadacts/Models/user_model.dart';
import 'package:gadacts/controller/user_controller.dart';
import 'package:gadacts/firebase_helper/database.dart';
import 'package:gadacts/services.dart/locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  //32-16=18
                  leading: null,
                  automaticallyImplyLeading: true,
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Color(0xffFFF9EC),
                  forceElevated: true,
                  floating: true,
                  collapsedHeight: 36,
                  expandedHeight: 38,
                  toolbarHeight: 26,
                  //TODO:implement height correctly

                  title: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: FutureBuilder(
                      future: locator
                          .get<Database>()
                          .getPosts(), //TODO:Retrieve data from firestore
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text('Loading...'));
                        } else
                          return SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var post = snapshot.data[index];
                              return Container(
                                height: MediaQuery.of(context).size.height*0.45,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width,
                                      decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(20)
                                      ),
                                      child: Image(image: NetworkImage(post.data['image'])),
                                    ),
                                    Text(post.data['title']),

                                  ],
                                ),
                              );
                            },
                            childCount: snapshot.data.length,
                          ));
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: 8,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 22,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Welcome, ${currentUser?.displayName ?? '.'}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Here are your today's updates",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 12))
                  ]),
            ),
          )
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}
