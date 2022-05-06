import 'package:flutter/material.dart';
import 'package:flutter_exam/screens/add_new_screen.dart';
import 'package:flutter_exam/screens/home_screen.dart';
import 'package:flutter_exam/screens/info_screen.dart';
import 'package:flutter_exam/screens/list_screen.dart';
import 'package:flutter_exam/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      initialRoute: '$HomePage',
      routes: {
        '$HomePage': (_) => const HomePage(),
        '/add': (_) => const FormStudentScreen(),
        '/update': (_) => const FormStudentScreen(),
        '$ListScreen': (_) => const ListScreen(),
        '$InfoScreen': (_) => const InfoScreen()
      },
    );
  }
}
