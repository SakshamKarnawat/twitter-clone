import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/screens/wrapper.dart';
import 'package:twitter_clone/services/auth.dart';
import 'models/user_model.dart';
import 'screens/auth/signup.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Twitter Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamProvider<UserModel?>.value(
        value: AuthService().user,
        child: ScreenUtilInit(
            designSize: const Size(1080, 1920),
            builder: () => const MaterialApp(home: Wrapper())),
        initialData: null,
        // routes: {
        //   '/': (context) => const Wrapper(),
        //   '/home': (context) => const HomeScreen(),
        //   '/signup': (context) => const SignUp(),
        // },
      ),
    );
  }
}
