// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;
  DrinkTile({super.key,required this.drink,required this.onTap,required this.trailing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}