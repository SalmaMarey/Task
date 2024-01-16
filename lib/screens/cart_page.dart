import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tash_provider/provider/card_notifier.dart';

import 'package:tash_provider/widgets/new_card.dart';

import '../models/badge_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'My Shopping Cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          BadgeModel(),
        ],
      ),
      body: Consumer<CardNotifer>(
        builder: (context, CardNotifer data, child) {
          return data.getdata.isEmpty
              ? const Center(
                  child: Text('Nothing here'),
                )
              : ListView.builder(
                  itemCount: data.getdata.length,
                  itemBuilder: (context, index) {
                    return NewCardPage(
                      containerData: data.getdata[index],
                    );
                  });
        },
      ),
    );
  }
}
