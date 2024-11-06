import 'package:flutter/material.dart';
import 'flashscreen.dart';
import 'login.dart';
import 'register.dart';
import 'password.dart'; 
import 'home.dart';
import 'akun.dart';
import 'profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Flashscreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/password': (context) => const PasswordScreen(),
        '/home' : (context) => const HomeScreen(),
        '/akun' : (context) => const AkunScreen(),
        '/profile' : (context) => const ProfileScreen(),
      },
    );
  }
}
