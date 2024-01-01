import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_shop/models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final void Function()? onTap;
  final Widget trailing;
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 197, 178, 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            title: Text(
              drink.name,
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              drink.price,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                drink.imagePath,
                height: 150,
              ),
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
