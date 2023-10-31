import 'package:cryptocurrency_card/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Cryptocurrency card',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
