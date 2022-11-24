import 'package:diary_app/theme/colors.dart';
import 'package:diary_app/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              minimumSize: const Size(360, 50),
            ),
          ),
          primarySwatch: Palette.primaryColor,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Palette.primaryColor)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white70),
            ),
          )),
      home: const WidgetTree(),
    );
  }
}
