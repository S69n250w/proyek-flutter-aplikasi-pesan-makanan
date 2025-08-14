import 'package:aplikasi_sederhana/model/food.dart';
import 'package:aplikasi_sederhana/screen/components/food_card.dart';
import 'package:aplikasi_sederhana/screen/views/food_detail/food_detail_screen.dart';
import 'package:flutter/material.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final Food food = Food(
    id: "1",
    name: "Kangkung Belacan",
    description: "",
    imageUrl: "assets/img/kangkung_belacan.jpg",
    price: 15000,
    qty: 1
  );
  @override
  Widget build(BuildContext context) {

    // return FoodDetailScreen();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Browse",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              leading: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              hintText: 'Search for food',
              hintStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
              onChanged: (value) {
                
              },
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          Expanded(
            child: Padding (
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0
                ),
                children: [
                  FoodCard(
                    foodItem: Food(
                      id: '1',
                      name: 'Ikan Kakap Sambalado',
                      description: '',
                      imageUrl: 'assets/img/ikan_kakap_sambalado.jpg',
                      price: 20000,
                      qty: 1
                    )
                  ),
                  FoodCard(
                    foodItem: Food(
                      id: '2',
                      name: 'Kangkung Belacan',
                      description: '',
                      imageUrl: 'assets/img/kangkung_belacan.jpg',
                      price: 15000,
                      qty: 1
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodDetailScreen(food: food))
                      );
                    },
                    child: const Text("Lihat Halaman Detil"),
                  ),
                  FoodCard(
                    foodItem: Food(
                      id: '3',
                      name: 'Brokoli Tumis Jagung',
                      description: '',
                      imageUrl: 'assets/img/brokoli_tumis_jagung.jpg',
                      price: 10000,
                      qty: 1
                    )
                  ),
                  FoodCard(
                    foodItem: Food(
                      id: '4',
                      name: 'Udang Saus Tiram',
                      description: '',
                      imageUrl: 'assets/img/udang_saus_tiram.jpg',
                      price: 30000,
                      qty: 1
                    )
                  ),
                  FoodCard(
                    foodItem: Food(
                      id: '5',
                      name: 'Soto',
                      description: '',
                      imageUrl: 'assets/img/soto.jpg',
                      price: 25000,
                      qty: 1
                    )
                  ),
                  FoodCard(
                    foodItem: Food(
                      id: '6',
                      name: 'Kacang Panjang Tumis Udang',
                      description: '',
                      imageUrl: 'assets/img/kacang_panjang_tumis_udang.jpg',
                      price: 15000,
                      qty: 1
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}