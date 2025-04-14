import 'package:flag_explorer_web/screens/home_screen.dart';
import 'package:flag_explorer_web/service/ApiService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(
        apiService: ApiService(Uri.parse("http://localhost:3000")),
      ),
    );
  }
}
