import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/card_notifier.dart';

class CardWidget extends StatelessWidget {
  final ContainerData containerData;
  const CardWidget({
    super.key,
    required this.containerData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 200,
            child: Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Blue Bag',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://www.freepngimg.com/thumb/bag/34521-8-women-bag-transparent.png',
                      width: 200,
                      height: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CardNotifer>(context, listen: false)
                        .increaseBadgeCount();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      )),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 200,
            child: Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Blue Bag',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://i.pinimg.com/originals/55/90/f8/5590f81c88cc0ef5dad6989e04fe3ddd.png',
                      width: 200,
                      height: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CardNotifer>(context, listen: false)
                        .addData(containerData);
                    Navigator.pop(context);
                    Provider.of<CardNotifer>(context, listen: false)
                        .increaseBadgeCount();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      )),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
