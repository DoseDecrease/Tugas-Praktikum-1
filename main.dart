import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F2EB),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;
  final _pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          height: 580,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD4C5B9)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Scaffold(
              body: _pages[_index],
              bottomNavigationBar: SizedBox(
                height: 46, // Ketinggian bar navigasi diperkecil lagi dari 54 ke 46
                child: BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (i) => setState(() => _index = i),
                  backgroundColor: const Color(0xFF4A3E3D),
                  selectedItemColor: const Color(0xFFD4C5B9),
                  unselectedItemColor: const Color(0xFF9E8E8D),
                  iconSize: 18, // Ukuran ikon diperkecil dari 20 ke 18
                  selectedFontSize: 10, // Ukuran teks diperkecil dari 11 ke 10
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.holiday_village), label: 'Villa'),
                    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> roomData = [
      {'name': 'Deluxe Room', 'price': 'Rp 450.000'},
      {'name': 'Suite Room', 'price': 'Rp 650.000'},
      {'name': 'Family Room', 'price': 'Rp 850.000'},
      {'name': 'Presidential', 'price': 'Rp 1.250.000'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VillaGo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A3E3D), fontSize: 18, letterSpacing: 1.1),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 45,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFFE6DFD3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/villa.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.villa, size: 40, color: Color(0xFF8C7A6B)),
                      Text('Foto Villa', style: TextStyle(color: Color(0xFF8C7A6B), fontSize: 11, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (_, index) => Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE6DFD3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xFFDCD4C4),
                        child: Image.asset(
                          'assets/images/kamar_${index + 1}.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Center(
                            child: Icon(Icons.bed, size: 30, color: Color(0xFF8C7A6B)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roomData[index]['name']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A3E3D),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '${roomData[index]['price']!}/malam',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8C7A6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VillaGo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A3E3D), fontSize: 18, letterSpacing: 1.1),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 45,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6DFD3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF8C7A6B),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6DFD3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.account_box, color: Color(0xFF4A3E3D), size: 20),
                    SizedBox(width: 10),
                    Text(
                      'User Account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A3E3D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6DFD3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.settings, color: Color(0xFF4A3E3D), size: 20),
                    SizedBox(width: 10),
                    Text(
                      'Account Settings',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A3E3D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}