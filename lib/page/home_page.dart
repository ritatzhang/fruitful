import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruitful/provider/google_sign_in.dart';
import 'package:fruitful/widget/logged_in_widget.dart';
import 'package:fruitful/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

//import 'package:fruitful/widget/loggedin_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                // return LoggedInWidget();
                //return _LoggedInHome();
                
                return MaterialApp(
                home: _LoggedInHome(),
              );

              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          // CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}

class _LoggedInHome extends StatefulWidget{
  @override
  LoggedInHome createState() => LoggedInHome();
}


class LoggedInHome extends State<_LoggedInHome> {
  @override
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("u r logged in"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
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
