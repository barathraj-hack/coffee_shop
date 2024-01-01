import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_shop/components/drink_tile.dart';
import 'package:icecream_shop/models/drink.dart';
import 'package:icecream_shop/models/shop.dart';
import 'package:icecream_shop/pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // go to order page
    void goToOrderPage(Drink drink) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(
            drink: drink,
          ),
        ),
      );
    }

    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                // heading
                Text(
                  'Bubble Tea Shop',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // list of drinks for sale
                Expanded(
                  child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      // get individual drink from shop
                      Drink individualDrink = value.shop[index];

                      // get a nice shop tile
                      return DrinkTile(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(individualDrink),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
