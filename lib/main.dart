import 'package:flutter/material.dart';
import 'package:github_api_app/screen/user_list.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Git hub",
      home: UserList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
