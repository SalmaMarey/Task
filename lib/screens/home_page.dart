// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tash_provider/screens/cart_page.dart';
import 'package:tash_provider/widgets/card_widget.dart';

import '../models/card_notifier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Women',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              width: 220,
            ),
            Stack(children: [
              Positioned(
                right: 5,
                bottom: 31,
                child: Consumer<CardNotifer>(
                  // ignore: avoid_types_as_parameter_names
                  builder: (context, CardNotifer, child) => Badge(
                    label: Text(
                      '${CardNotifer.badgeCount}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const CartPage()));
                },
              ),
            ]),
          ],
        ),
      ),
      // body: CardWidget(
      //     containerData: Provider.of(context).getdata[ContainerData]),
    );
  }
}
