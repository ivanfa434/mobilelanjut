import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorText; // Variable for error text

  // Email validation function
  bool _validateEmail() {
    String email = _emailController.text;
    if (email.isEmpty) {
      setState(() {
        _errorText = 'Email tidak boleh kosong';
      });
      return false;
    }
    // Regex for basic email validation
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      setState(() {
        _errorText = 'FFormat email tidak valid';
      });
      return false;
    }
    setState(() {
      _errorText = null; // Clear error message if valid
    });
    return true;
  }

  void _sendCode() {
    if (_validateEmail()) {
      // Show a popup message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Berhasil"),
            content: const Text("Kode etik berhasil terkirim"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                  Navigator.pushReplacementNamed(context, '/login'); // Navigate to LoginScreen
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Image.asset(
                'assets/logolanjut.jpeg',
                height: 100,
              ),
              const SizedBox(height: 24.0),

              // Title "Lupa Password"
              const Text(
                'Lupa Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),

              // "Pesan" label
              const Text(
                'Pesan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),

              // Instruction text
              const Text("Masukan email Anda dan tunggu kode etik akan dikirimkan."),
              const SizedBox(height: 16.0),

              // Label "Masukkan Email"
              const Text('Masukkan Email'),
              const SizedBox(height: 8.0),

              // Email input field
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Email',
                  errorText: _errorText, // Display error message if any
                ),
              ),
              const SizedBox(height: 24.0),

              // Send button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sendCode,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
