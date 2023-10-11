import 'package:flutter/material.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier{
  //list of drinks for sale
  final List<Drink> _shop = [
    Drink(
      name: "Pearl Milk Tea",
      price: "20",
      imagePath: "assets/images/tea.png")
  ];

  //list of drink in user cart
  final List<Drink> _userCart = [];

  //get user cart
  List<Drink> get cart => _userCart;

  //get drinks for sale
  List<Drink> get shop => _shop;

  //add to cart
  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }

  // remove to cart
  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }
}
