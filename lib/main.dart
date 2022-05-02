import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/auth/login_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

import 'controllers/auth_controller.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
        stream: AuthController().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return HomeScreen();
          }

          return LoginScreen();
        },
      ),
    );
  }
}
