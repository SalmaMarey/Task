import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tash_provider/models/badge_model.dart';

import 'package:tash_provider/widgets/card_widget.dart';

import '../provider/card_notifier.dart';

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
        title: const Row(
          children: [
            Text(
              'Women',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              width: 220,
            ),
            BadgeModel()
          ],
        ),
      ),
      body: Consumer<CardNotifer>(builder: (context, CardNotifer data, child) {
        return ListView.builder(
            itemCount: data.getHomeData.length,
            itemBuilder: (context, index) {
              return CardWidget(
                containerData: data.getHomeData[index],
              );
            });
      }),
    );
  }
}
