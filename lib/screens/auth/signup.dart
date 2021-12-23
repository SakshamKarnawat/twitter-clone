import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  String name = '';
  int nameCount = 50;
  String email = '';
  String password = '';

  String? validateName(String value) {
    if (value.length > 50) {
      return "Must be 50 characters or fewer.";
    }
    /* else if (value.trim() == "") {
      return "What's your name?";
    } */
    return null;
  }

  String? validateEmail(String email) {
    RegExp regex = RegExp("
        [a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (email.isNotEmpty && !regex.hasMatch(email)) {
      Future.delayed(const Duration(milliseconds: 500), () {
        return 'Enter a valid email address';
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      //Top row consisting of Back Button and Twitter Icon:
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 66.sp,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlue,
            size: 66.sp,
          ),
        ),
        leadingWidth: 100.sp,
        title: Icon(
          FontAwesomeIcons.twitter,
          color: primaryBlue,
          size: 66.sp,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 70.sp),
              child: Column(
                children: [
                  //"Create your account" text:
                  Container(
                    height: 0.1.sh,
                    width: 1.sw,
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 90.sp,
                        letterSpacing: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //"Name" Form Field:
                  Container(
                    height: 0.1.sh,
                    child: TextFormField(
                      onChanged: (val) => setState(() {
                        name = val;
                        nameCount = 50 - val.length;
                      }),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 50.sp, 0, 0),
                        hintText: "Name",
                        counterText: '$nameCount',
                        counterStyle: TextStyle(
                          color: nameCount < 0
                              ? Colors.red
                              : const Color(0x99000000),
                        ),
                        errorText: validateName(name),
                        suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 40.sp, right: 0),
                            child: name.isEmpty || name.length > 50
                                ? null
                                : const Icon(Icons.check_circle_outline_sharp,
                                    color: Colors.green)),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                    ),
                  ),
                  //"Phone number or email address" Form Field:
                  Container(
                    height: 0.1.sh,
                    child: TextFormField(
                      onChanged: (val) => setState(() {
                        email = val;
                        // nameCount = 50 - val.length;
                      }),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 50.sp, 0, 0),
                        hintText: "Phone number or email address",
                        errorText: validateEmail(email),
                      ),
                    ),
                  ),
                  //"Date of birth" Form Field:

                  /*Sign up and sign in working buttons:
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
               */
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "A", icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(label: "c", icon: Icon(Icons.ac_unit)),
        ],
      ),
    );
  }
}
