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

  String? validateName(value) {
    if (value.length > 50) {
      return "Must be 50 characters or fewer.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              //Top row consisting of Back Button and Twitter Icon:
              Container(
                height: 0.075.sh,
                color: Colors.blueGrey,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.sp),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          FontAwesomeIcons.twitter,
                          color: primaryBlue,
                          size: 66.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashRadius: 66.sp,
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: primaryBlue,
                          size: 66.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //"Create your account" text:
              Container(
                height: 0.1.sh,
                width: 1.sw,
                padding: EdgeInsets.only(top: 60.sp, left: 100.sp),
                child: Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 90.sp,
                    letterSpacing: 0.75.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Empty space
              Container(
                height: 0.15.sh,
                color: Colors.red,
              ),
              //"Name" Form Field:
              Container(
                color: Colors.amber,
                height: 0.1.sh,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 110.sp),
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
              ),
              Container(
                color: Colors.green,
              ),
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
