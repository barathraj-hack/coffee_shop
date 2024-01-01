import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_shop/components/drink_tile.dart';
import 'package:icecream_shop/models/drink.dart';
import 'package:icecream_shop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // your cart
              Text(
                'Your Cart',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // list view
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in cart first
                    Drink drink = value.cart[index];

                    // return a nice tile
                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
