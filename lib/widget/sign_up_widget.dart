import 'package:flutter/material.dart';
import 'package:fruitful/widget/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          buildSignUp(),
        ],
    );

  Widget buildSignUp() => Container(
    color: Colors.lime[100],
    child:
      Column(
        children: [
          Spacer(flex:2),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 300,
              child: Text(
                'welcome to fruitful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightGreen[900],
                  fontSize: 50,
                  fontFamily: "WorkSans"
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
    )
    
  );
}
