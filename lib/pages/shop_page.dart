import 'package:flutter/material.dart';

import '../components/Product_Tile.dart';
import '../models/BeautyProd.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage> {
  // Obj List
  List<BeautyProd> productData = [
    BeautyProd(
      name: 'Gel Toner',
      price: '100',
      imagePath: 'lib/images/fsoap.png',
    ),
    BeautyProd(
      name: 'Sunblock',
      price: '50',
      imagePath: 'lib/images/fglowskin.png',
    ),
    BeautyProd(
      name: 'Kojic Rejuvinating Soap',
      price: '80',
      imagePath: 'lib/images/frejuv.png',
    ),
    BeautyProd(
      name: 'Toner',
      price: '125',
      imagePath: 'lib/images/fsoap.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
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

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              BeautyProd beautyProd = productData[index];
              return ProductTile(beautyProd: beautyProd);
            },
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            )),
      ],
    );
  }
}
