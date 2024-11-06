import 'package:flutter/material.dart';
import 'package:pengembanganlanjut/profile.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun"),
      ),
      body: Column(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Image as a square
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Slightly rounded corners
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
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          // Options List
          ListTile(
            title: const Text(
              "Kelola Akun",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const Divider(height: 1, thickness: 1),
          ListTile(
            title: const Text(
              "Notifikasi",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle Notifikasi tap
            },
          ),
          const Divider(height: 1, thickness: 1),
          ListTile(
            title: const Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle Privacy Policy tap
            },
          ),
          const Divider(height: 1, thickness: 1),
          ListTile(
            title: const Text(
              "Terms of Service",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle Terms of Service tap
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 2) {
            _showLogoutDialog(context);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Akun'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }

  // Method to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Logout"),
          content: const Text("Apakah Anda yakin ingin logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("NO"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Arahkan ke halaman login setelah logout
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("YES"),
            ),
          ],
        );
      },
    );
  }
}
