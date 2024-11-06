import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;
  // ignore: unused_field
  bool _isPasswordValid = true;

  // Key untuk form dan validasi
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Method untuk memvalidasi email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Email';
    }
    // Validasi format email sederhana
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  // Method untuk memvalidasi password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
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

                // Title "Masuk"
                const Text(
                  'Masuk',
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
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Email',
                    errorText: _isEmailValid ? null : 'Format email anda salah',
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16.0),

                // Label "Masukkan Password"
                const Text('Masukkan Password'),
                const SizedBox(height: 8.0),

                // Input Password
                TextFormField(
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
                  ),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 8.0),

                // Teks "Belum punya akun ?" dan "Lupa password ?" dalam satu baris (sejajar)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Teks Belum punya akun?
                    const Text(
                      'Belum punya akun?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    // Teks Lupa password? di sebelah kanan
                    GestureDetector(
                      onTap: () {
                        // Aksi saat "Lupa password ?" diklik
                        Navigator.pushNamed(context, '/password');
                      },
                      child: const Text(
                        'Lupa password ?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),

                // Teks "Daftar" di bawah "Belum punya akun?"
                GestureDetector(
                  onTap: () {
                    // Aksi saat "Daftar" diklik
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),

                // Tombol Masuk (Teks Putih dengan Latar Belakang Biru)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aksi saat tombol "Masuk" diklik
                        Navigator.pushNamed(context, '/home');
                      } else {
                        setState(() {
                          _isEmailValid = _emailController.text.isNotEmpty && _validateEmail(_emailController.text) == null;
                          _isPasswordValid = _passwordController.text.isNotEmpty && _validatePassword(_passwordController.text) == null;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Warna teks putih
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Masuk'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
