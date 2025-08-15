import 'package:aplikasi_sederhana/model/food.dart';
import 'package:aplikasi_sederhana/screen/components/food_card.dart';
import 'package:aplikasi_sederhana/screen/views/checkout_screen.dart';
import 'package:aplikasi_sederhana/screen/views/food_detail/food_detail_screen.dart';
import 'package:flutter/material.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<Food> food = [
    Food(
      id: '1',
      name: 'Ikan Kakap Sambalado',
      description: '',
      imageUrl: 'assets/img/ikan_kakap_sambalado.jpg',
      price: 20000,
      qty: 1
    ),
    Food(
      id: '2',
      name: 'Kangkung Belacan',
      description: '',
      imageUrl: 'assets/img/kangkung_belacan.jpg',
      price: 15000,
      qty: 1
    ),
    Food(
      id: '3',
      name: 'Brokoli Tumis Jagung',
      description: '',
      imageUrl: 'assets/img/brokoli_tumis_jagung.jpg',
      price: 10000,
      qty: 1
    ),
    Food(
      id: '4',
      name: 'Udang Saus Tiram',
      description: '',
      imageUrl: 'assets/img/udang_saus_tiram.jpg',
      price: 30000,
      qty: 1
    ),
    Food(
      id: '5',
      name: 'Soto',
      description: '',
      imageUrl: 'assets/img/soto.jpg',
      price: 25000,
      qty: 1
    ),
    Food(
      id: '6',
      name: 'Kacang Panjang Tumis Udang',
      description: '',
      imageUrl: 'assets/img/kacang_panjang_tumis_udang.jpg',
      price: 15000,
      qty: 1
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen(cartItems: food))
              );
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0
                ),
                itemCount: food.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    foodItem: food[index], 
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(food: food[index])
                          )
                        );
                    }
                  );
                },
                
                // children: [
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '1',
                  //     name: 'Ikan Kakap Sambalado',
                  //     description: '',
                  //     imageUrl: 'assets/img/ikan_kakap_sambalado.jpg',
                  //     price: 20000,
                  //     qty: 1
                  //   )
                  // ),

                  // FoodCard(
                  //   foodItem: food[0],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[0]))
                  //     );
                  //   },
                  // ),
                  
                  // FoodCard(
                  //   foodItem: food[1],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[1]))
                  //     );
                  //   },
                  // ),

                  // FoodCard(
                  //   foodItem: food[2],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[2]))
                  //     );
                  //   },
                  // ),

                  // FoodCard(
                  //   foodItem: food[3],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[3]))
                  //     );
                  //   },
                  // ),

                  // FoodCard(
                  //   foodItem: food[4],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[4]))
                  //     );
                  //   },
                  // ),

                  // FoodCard(
                  //   foodItem: food[5],
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FoodDetailScreen(food: food[5]))
                  //     );
                  //   },
                  // ),
                  
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '2',
                  //     name: 'Kangkung Belacan',
                  //     description: '',
                  //     imageUrl: 'assets/img/kangkung_belacan.jpg',
                  //     price: 15000,
                  //     qty: 1
                  //   )
                  // ),
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '3',
                  //     name: 'Brokoli Tumis Jagung',
                  //     description: '',
                  //     imageUrl: 'assets/img/brokoli_tumis_jagung.jpg',
                  //     price: 10000,
                  //     qty: 1
                  //   )
                  // ),
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '4',
                  //     name: 'Brokoli Tumis Jagung','Udang Saus Tiram',
                  //     description: '',
                  //     imageUrl: 'assets/img/udang_saus_tiram.jpg',
                  //     price: 30000,
                  //     qty: 1
                  //   )
                  // ),
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '5',
                  //     name: 'Brokoli Tumis Jagung','Udang Saus Tiram','Soto',
                  //     description: '',
                  //     imageUrl: 'assets/img/soto.jpg',
                  //     price: 25000,
                  //     qty: 1
                  //   )
                  // ),
                  // FoodCard(
                  //   foodItem: Food(
                  //     id: '6',
                  //     name: 'Brokoli Tumis Jagung','Udang Saus Tiram','Soto','Kacang Panjang Tumis Udang',
                  //     description: '',
                  //     imageUrl: 'assets/img/kacang_panjang_tumis_udang.jpg',
                  //     price: 15000,
                  //     qty: 1
                  //   )
                  // ),
                // ],
              ),
            ),
          ),
        ],
      )
    );
  }
}