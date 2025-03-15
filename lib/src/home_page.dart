import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Nasi Goreng', 'price': 20000, 'image': 'assets/img/nasi.jpg'},
    {'name': 'Mie Ayam', 'price': 15000, 'image': 'assets/img/mie.jpg'},
    {'name': 'Sate Ayam', 'price': 25000, 'image': 'assets/img/sate.jpg'},
    {'name': 'Ayam Geprek', 'price': 18000, 'image': 'assets/img/geprek.jpg'},
    {'name': 'Bakso', 'price': 16000, 'image': 'assets/img/bakso.jpeg'},
    {'name': 'Soto Ayam', 'price': 17000, 'image': 'assets/img/soto.jpg'},
  ];

  void _orderItem(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderPage(orderItem: item)),
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                'img/header.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(menuItems[index]['image'],
                          width: 80, height: 80, fit: BoxFit.cover),
                    ),
                    title: Text(menuItems[index]['name'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('Rp ${menuItems[index]['price']}',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.orange)),
                    trailing: ElevatedButton(
                      onPressed: () => _orderItem(menuItems[index]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Pesan',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
