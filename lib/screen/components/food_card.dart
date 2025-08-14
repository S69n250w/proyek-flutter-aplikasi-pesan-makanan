import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/model/food.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            foodItem.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    foodItem.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  foodItem.price.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}