import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/models/BeautyProd.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  BeautyProd beautyProd;
  CartItem({super.key, required this.beautyProd});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(
      context,
      listen: false,
    ).removeItemCart(widget.beautyProd);
  }

  @override
  Widget build(Object context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            child: Image.asset(widget.beautyProd.imagePath),
          ),
          title: Text(widget.beautyProd.name),
          subtitle: Text(widget.beautyProd.price),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: removeItemFromCart,
          ),
        ),
      ),
    );
  }
}
