import 'package:fake_instagram/features/auth/presentation/pages/auth_page.dart';
import 'package:fake_instagram/themes/light_mode.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthPage(),
    );
  }
}
