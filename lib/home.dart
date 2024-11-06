import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController _bellAnimationController;

  // Data untuk GridView
  final List<Map<String, String>> gridItems = [
    {"image": "assets/gambar1.jpg", "title": "Judul 1", "description": "Deskripsi 1"},
    {"image": "assets/gambar2.jpg", "title": "Judul 2", "description": "Deskripsi 2"},
    {"image": "assets/gambar3.jpg", "title": "Judul 3", "description": "Deskripsi 3"},
    {"image": "assets/gambar4.jpg", "title": "Judul 4", "description": "Deskripsi 4"},
    {"image": "assets/gambar5.jpg", "title": "Judul 5", "description": "Deskripsi 5"},
  ];

  // Data untuk ListView
  final List<Map<String, String>> listItems = [
    {"image": "assets/gambar1.jpg", "title": "Headline 1", "description": "Deskripsi 1"},
    {"image": "assets/gambar2.jpg", "title": "Headline 2", "description": "Deskripsi 2"},
    {"image": "assets/gambar3.jpg", "title": "Headline 3", "description": "Deskripsi 3"},
    {"image": "assets/gambar4.jpg", "title": "Headline 4", "description": "Deskripsi 4"},
    {"image": "assets/gambar5.jpg", "title": "Headline 5", "description": "Deskripsi 5"},
  ];

  @override
  void initState() {
    super.initState();
    _bellAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    _bellAnimationController.dispose();
    super.dispose();
  }

  void _toggleBellAnimation() {
    _bellAnimationController.forward().then((value) => _bellAnimationController.reverse());
  }

  // Show logout confirmation dialog
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
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("YES"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: const Text(
          'Guest',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: RotationTransition(
              turns: Tween(begin: -0.1, end: 0.1).animate(CurvedAnimation(
                parent: _bellAnimationController,
                curve: Curves.elasticIn,
              )),
              child: const Icon(Icons.notifications),
            ),
            onPressed: _toggleBellAnimation,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Grid View Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"]!, width: 80, height: 80),
                        const SizedBox(height: 8),
                        Text(item["title"]!, style: const TextStyle(fontSize: 16)),
                        Text(item["description"]!, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // List View Section
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                final item = listItems[index];
                return ListTile(
                  leading: Image.asset(item["image"]!, width: 50, height: 70),
                  title: Text(item["title"]!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["description"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(),
                      Row(
                        children: [
                          const Icon(Icons.add_circle_outline),
                          const SizedBox(width: 8),
                          const Text("Today • 23 min"),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                            onPressed: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {
            if (index == 1) {
              Navigator.pushNamed(context, '/akun');
            } else if (index == 2) {
              _showLogoutDialog(context);
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Akun'),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
