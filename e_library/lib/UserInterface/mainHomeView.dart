import 'package:e_library_flutter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'games.dart';
import 'movies.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return
      Scaffold(
        appBar: AppBar(title: Text('eLibrary'),),

        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Text('Welcome ' + user.displayName,
              textDirection: TextDirection.ltr,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/books');
            }, child: Text('Books')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/movies');
            },
                child: Text('Movies')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/games');
            }, child: Text('Games')),
            ElevatedButton(onPressed: () async {
              await _authService.signOut();
            },
                child: Text('Log out')),
          ],
        ),


      );







  }
}
