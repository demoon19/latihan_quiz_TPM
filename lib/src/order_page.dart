import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final Map<String, dynamic> orderItem;

  const OrderPage({super.key, required this.orderItem});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;
  final TextEditingController _quantityController = TextEditingController();
  bool showTotalPrice = false;

  @override
  void initState() {
    super.initState();
    _quantityController.text = quantity.toString(); // Set default value
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _updateQuantity(String value) {
    setState(() {
      int newQuantity = int.tryParse(value) ?? 1;
      quantity = newQuantity > 0 ? newQuantity : 1;
    });
  }

  void _showTotalPrice() {
    setState(() {
      showTotalPrice = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.orderItem['price'] * quantity;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.orderItem['image'],
                  width: 250,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Pesanan: ${widget.orderItem['name']}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga per porsi: Rp ${widget.orderItem['price']}',
              style: const TextStyle(fontSize: 18, color: Colors.orange),
            ),
            const SizedBox(height: 15),

            // Input Jumlah Pesanan
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Pesanan',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: _updateQuantity,
            ),

            const SizedBox(height: 25),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showTotalPrice();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Pesanan Berhasil!',
                            textAlign: TextAlign.center)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Tampilkan total harga hanya setelah tombol ditekan
            if (showTotalPrice)
              Center(
                child: Text(
                  'Total Harga: Rp $totalPrice',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
