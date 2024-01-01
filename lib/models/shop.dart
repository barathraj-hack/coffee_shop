import 'package:flutter/material.dart';
import 'package:icecream_shop/models/drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    Drink(
      name: 'Milk Tea',
      price: '40.00',
      imagePath: 'lib/images/milk.jpg',
    ),
    Drink(
      name: 'Black Tea',
      price: '60.00',
      imagePath: 'lib/images/black.jpg',
    ),
    Drink(
      name: 'Green Tea',
      price: '40.00',
      imagePath: 'lib/images/green.jpg',
    ),
  ];

  // list of drinks in user cart
  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
