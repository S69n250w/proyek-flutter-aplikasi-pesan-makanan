import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/model/food.dart';

class FoodCard extends StatelessWidget {

  final Food foodItem;
  final VoidCallback onTap;
  
  const FoodCard({super.key, required this.foodItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}