import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_shop/models/drink.dart';
import 'package:icecream_shop/models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize sweetness
  double milkValue = 0.5;
  void customizeMilk(double newMilk) {
    setState(() {
      milkValue = newMilk;
    });
  }

  // add to cart
  void addToCart() {
    // first add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // go to home page
    Navigator.pop(context);

    // let the user know the cart added successfully
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Center(
          child: Text(
            'Successfully added to cart',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          //image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('lib/images/milk.jpg'),
            ),
          ),
          //sliders to customize
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // sugar customize
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Sugar level',
                        style: GoogleFonts.outfit(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        label: sweetValue.toString(),
                        divisions: 4,
                        value: sweetValue,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),
                // milk thickness
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Milk level',
                        style: GoogleFonts.outfit(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        label: milkValue.toString(),
                        divisions: 4,
                        value: milkValue,
                        onChanged: (value) => customizeMilk(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //add to cart button
          Padding(
            padding: const EdgeInsets.only(top: 270.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(16),
              ),
              child: MaterialButton(
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                onPressed: addToCart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
