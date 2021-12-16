import 'package:flutter/material.dart';
import 'package:twitter_clone/services/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text("Sign Out"),
            onPressed: () async {
              _authService.signOut();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Welcome to Twitter Clone!")));
          },
          child: const Text("Twitter Clone"),
        ),
      ),
    );
  }
}
