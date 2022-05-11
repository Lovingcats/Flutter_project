import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  void _showButtonPressDialog(BuildContext context, String provider) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('$provider Button Pressed!'),
    backgroundColor: Colors.black26,
    duration: Duration(milliseconds: 400),
  ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
        appBar: null,
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInButtonBuilder(
                  text: 'Get going with Email',
                  icon: Icons.email,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Email');
                  },
                  backgroundColor: Colors.blueGrey[700]!,
                  width: 220.0,
                ),
                const Divider(),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Google');
                  },
                ),
                const Divider(),
                SignInButton(
                  Buttons.FacebookNew,
                  onPressed: () {
                    _showButtonPressDialog(context, 'FacebookNew');
                  },
                ),
                const Divider(),
                SignInButton(
                  Buttons.Apple,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Apple');
                  },
                ),
                const Divider(),
                SignInButton(
                  Buttons.GitHub,
                  text: "Sign up with GitHub",
                  onPressed: () {
                    _showButtonPressDialog(context, 'Github');
                  },
                ),
                const Divider(),
                SignInButton(
                  Buttons.Microsoft,
                  text: "Sign up with Microsoft ",
                  onPressed: () {
                    _showButtonPressDialog(context, 'Microsoft ');
                  },
                ),
                const Divider(),
                SignInButton(
                  Buttons.Twitter,
                  text: "Use Twitter",
                  onPressed: () {
                    _showButtonPressDialog(context, 'Twitter');
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
