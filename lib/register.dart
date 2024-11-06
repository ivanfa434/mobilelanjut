import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  bool _passwordError = false;
  bool _confirmPasswordError = false;
  bool _emailError = false;
  String _emailErrorText = '';

  void _validateInputs() {
    setState(() {
      // Validasi untuk email
      if (_emailController.text.isEmpty) {
        _emailError = true;
        _emailErrorText = 'Email tidak boleh kosong';
      } else if (!_isValidEmail(_emailController.text)) {
        _emailError = true;
        _emailErrorText = 'Format email tidak valid';
      } else {
        _emailError = false;
        _emailErrorText = '';
      }

      // Validasi untuk password
      _passwordError = _passwordController.text.isEmpty;

      // Validasi untuk konfirmasi password
      _confirmPasswordError = _confirmPasswordController.text.isEmpty;
    });

    // Jika semua input valid, lanjutkan
    if (!_emailError && !_passwordError && !_confirmPasswordError) {
      Navigator.pushNamed(context, '/home');
    }
  }

  // Fungsi untuk validasi format email
  bool _isValidEmail(String email) {
    // Sederhana menggunakan regex untuk mengecek apakah email valid
    RegExp regExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return regExp.hasMatch(email);
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

              // Title "Daftar"
              const Text(
                'Daftar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),

              // Label "Masukkan Email"
              const Text('Masukkan Email'),
              const SizedBox(height: 8.0),

              // Input Email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Email',
                  errorText: _emailError ? _emailErrorText : null,
                  focusedBorder: _emailError
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16.0),

              // Label "Masukkan Password"
              const Text('Masukkan Password'),
              const SizedBox(height: 8.0),

              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  errorText: _passwordError ? 'Password tidak boleh kosong' : null,
                  focusedBorder: _passwordError
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16.0),

              // Label "Masukkan kembali Password"
              const Text('Masukkan kembali Password'),
              const SizedBox(height: 8.0),

              // Input Konfirmasi Password
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  errorText: _confirmPasswordError ? 'Konfirmasi password tidak boleh kosong' : null,
                  focusedBorder: _confirmPasswordError
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 8.0),

              // "Sudah memiliki akun?" dan "Masuk"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah memiliki akun? '),
                  GestureDetector(
                    onTap: () {
                      // Aksi saat "Masuk" diklik
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validateInputs, // Validasi saat tombol "Daftar" ditekan
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna biru sesuai desain
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Daftar',
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
