import 'package:aplikasi_sederhana/screen/views/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/model/food.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key, required this.food});
  final Food food ;

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 0;

  // Function to increase or decrease quantity
  void handleQuantityChange(int change) {
    setState(() {
      quantity += change;
      if(quantity < 0) quantity = 0; // Prevent negative quantity
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.food.name,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.food.imageUrl,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.food.price.toString(),
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
                        "Harga dasar",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            const Divider(thickness: 1.5),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Catatan ke Penjual",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  SizedBox(height: 15),

                  TextField(
                    minLines: 3,
                    maxLines: null,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Quantity selector (add/remove buttons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Decrease button
                  Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99.0),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () => handleQuantityChange(-1),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.orange,
                        ),
                      ),
                    ),

                  const SizedBox(width: 16, height: 16),
                  
                  // Display current quantity
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),

                  const SizedBox(width: 16, height: 16),

                  // Increase button
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(99.0),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () => handleQuantityChange(1),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // "Tambah ke Keranjang" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckoutScreen())
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Tambah ke Keranjang",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}