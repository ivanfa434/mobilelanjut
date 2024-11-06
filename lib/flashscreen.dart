import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Flashscreen> {
  @override
  void initState() {
    super.initState();
    // Timer selama 5 detik sebelum pindah ke halaman login
    Timer(const Duration(seconds: 5), () {
      // Navigasi ke halaman login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logolanjut.jpeg'), // Pastikan file gambar berada di folder assets
      ),
    );
  }
}
