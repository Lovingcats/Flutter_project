import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/success.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Future<Null> _login() async {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: <String>[
          'email',
        ],
      );

      try {
        var data = await _googleSignIn.signIn();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Success()),
        );
      } catch (error) {
        print(error);
      }
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
        appBar: null,
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Divider(),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    _login();
                    _showButtonPressDialog(context, 'Google');
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
                  text: "Sign up with Twitter",
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
