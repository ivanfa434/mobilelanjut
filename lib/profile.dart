import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Square shape
                image: const DecorationImage(
                  image: AssetImage('assets/fotoprofile.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Name and University
            const Text(
              "Ivan Fahrudin Aziz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Universitas Teknologi Yogyakarta",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Form fields
            _buildTextField("Email", _emailController, TextInputType.emailAddress, _isEditing),
            const SizedBox(height: 16),
            _buildTextField("Nama", _nameController, TextInputType.name, _isEditing),
            const SizedBox(height: 16),
            // Phone Number Field with country code selector
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Nomor Telepon"),
            ),
            IntlPhoneField(
              controller: _phoneController,
              initialCountryCode: 'ID', // Default to Indonesia (+62)
              enabled: _isEditing,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField("Alamat", _addressController, TextInputType.streetAddress, _isEditing),
            const SizedBox(height: 32),
            // Edit/Save Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isEditing ? Colors.green : Colors.blue, // Green for "Simpan", Blue for "Ubah Profil"
              ),
              child: Text(
                _isEditing ? "Simpan" : "Ubah Profil",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType inputType, bool isEnabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          enabled: isEnabled,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
