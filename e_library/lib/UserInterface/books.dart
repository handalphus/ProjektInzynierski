import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final _referenceDatabase = FirebaseDatabase.instance.reference().child("books");
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(title: Text('Books'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            _referenceDatabase.push().set({"author":"tolkien"}).asStream();
          }, child: Text('Send book'))
        ],
      ),

    );
  }
}
