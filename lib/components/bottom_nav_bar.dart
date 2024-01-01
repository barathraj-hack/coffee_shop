import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey.shade700,
        tabActiveBorder: Border.all(
          color: Colors.white,
        ),
        gap: 5,
        tabs: const [
          // shop
          GButton(
            icon: Icons.home_outlined,
            text: 'Shop',
          ),
          //cart
          GButton(
            icon: Icons.book_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
