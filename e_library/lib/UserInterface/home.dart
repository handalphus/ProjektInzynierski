import 'package:e_library_flutter/UserInterface/books.dart';
import 'package:e_library_flutter/UserInterface/games.dart';
import 'package:e_library_flutter/UserInterface/mainHomeView.dart';
import 'package:e_library_flutter/UserInterface/movies.dart';
import 'package:e_library_flutter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      initialRoute: '/mainHome',
      routes: {
        '/books':(context)=>Books(),
        '/mainHome':(context)=>MainHome(),
        '/movies':(context)=>Movies(),
        '/games':(context)=>Games(),
      },


         );




  }
}

