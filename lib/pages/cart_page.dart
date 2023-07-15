import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/models/BeautyProd.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual products
                  BeautyProd individual = value.getUserCart()[index];

                  //return cart item
                  return CartItem(
                    beautyProd: individual,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
