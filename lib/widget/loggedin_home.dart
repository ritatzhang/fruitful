import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitful/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class _LoggedInHome extends StatefulWidget{
  @override
  LoggedInHome createState() => LoggedInHome();
}

class LoggedInHome extends State<_LoggedInHome> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    int _currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("u r logged in"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "search"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: "camera"
        ),
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      ),
    );
  }
}
