import "package:flutter/material.dart";

import "BeautyProd.dart";

class Cart extends ChangeNotifier {
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
  List<BeautyProd> userCart = [];

  List<BeautyProd> getProductList() {
    return productData;
  }

  List<BeautyProd> getUserCart() {
    return userCart;
  }

  void addItemCart(BeautyProd beautyProd) {
    userCart.add(beautyProd);
    notifyListeners();
  }

  void removeItemCart(BeautyProd beautyProd) {
    userCart.remove(beautyProd);
    notifyListeners();
  }
}
