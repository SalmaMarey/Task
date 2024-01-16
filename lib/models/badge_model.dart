// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/card_notifier.dart';
import '../screens/cart_page.dart';

class BadgeModel extends StatelessWidget {
  const BadgeModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<CardNotifer>(
          // ignore: avoid_types_as_parameter_names
          builder: (context, CardNotifer, _) => IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const CartPage()));
              }),
        ),
        Consumer<CardNotifer>(
          // ignore: avoid_types_as_parameter_names
          builder: (context, CardNotifer, _) => CardNotifer.badgeCount > 0
              ? Positioned(
                  left: 23,
                  bottom: 27,
                  child: Badge(
                    label: Text(
                      CardNotifer.badgeCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
              : Container(),
        ),
      ],
    );
  }
}
