import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/Product_Tile.dart';
import '../models/BeautyProd.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage> {
  void addProductToCart(BeautyProd beautyProd) {
    Cart cart = Provider.of<Cart>(context, listen: false);

    // Check if the product name already exists in the cart
    bool isProductAlreadyInCart =
        cart.getUserCart().any((item) => item.name == beautyProd.name);

    if (!isProductAlreadyInCart) {
      cart.addItemCart(beautyProd);

      // Alert user
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Product Added!'),
          content: Text('Check your cart.'),
        ),
      );
    } else {
      // Product already exists in the cart, show an error message
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Error'),
          content: Text('Product already exists in the cart.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color: Colors.grey)),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // Message
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'KBN Skin Essentials Products',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          // Picture
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Main Product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text(
                  'see all',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // list of Products
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                BeautyProd beautyProd = value.getProductList()[index];
                return ProductTile(
                  beautyProd: beautyProd,
                  onTap: () => addProductToCart(beautyProd),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
