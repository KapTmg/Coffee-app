import 'package:flutter/material.dart';
import 'package:my_project_app/models/shop.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweetvalue
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  void addToCart(){
    //firstly add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

//direct user back to shop page
    Navigator.pop(context);

    //let user know it has been successfully added
    showDialog(
      context: context,
     builder: (context) => const AlertDialog(
      title: Text("Sucessfully added to Cart"),
     )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
        backgroundColor: Colors.brown[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //drink image
            Image.asset(widget.drink.imagePath),
      
            //sliders to customize drink
            Column(
              children: [
                //sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Sweet"),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                        label: sweetValue.toString(),
                      ),
                    )
                  ],
                ),
      
                //ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text("Ice"),),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                        label: iceValue.toString(),
                      ),
                    )
                  ],
                ),
      
                //pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text("Pearls"),),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                        label: pearlValue.toString(),
                      ),
                    )
                  ],
                ),
              ],
            ),
      
            //add to cart button
            MaterialButton(
              onPressed: addToCart,
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.brown),
                ),
            )
          ],
        ),
      ),
    );
  }
}
