import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/screens/auth/signup.dart';
import 'package:twitter_clone/screens/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null) {
      //auth routes:
      print("signup page");
      return const SignUp();
    }
    //main routes:
    return const HomeScreen();
  }
}
