import 'package:flutter/material.dart';
import 'package:shoppingapp/models/BeautyProd.dart';

class ProductTile extends StatelessWidget {
  BeautyProd beautyProd;
  ProductTile({super.key, required this.beautyProd});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Picture
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                beautyProd.imagePath,
                height: 200,
              ),
            ),

            // Name
            Column(
              children: [
                Text(
                  beautyProd.name,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '₱ ${beautyProd.price}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            // Add to Cart
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
