import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              //Top row consisting of Back Button and Twitter Icon:
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                      child: Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              //"Create your account" text:
              const Text("Create Your Account"),
              //"Name" Form Field:
              TextFormField(
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              ElevatedButton(
                  onPressed: () async => _authService.signUp(email, password),
                  child: const Text("Sign Up")),
              ElevatedButton(
                  onPressed: () async => _authService.signIn(email, password),
                  child: const Text("Sign In")),

              //"Phone number or email address" Form Field:
              //"Date of birth" Form Field:
            ],
          ),
        ),
      ),
    );
  }
}
