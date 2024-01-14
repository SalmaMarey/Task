import 'package:flutter/material.dart';
import 'package:tash_provider/models/card_notifier.dart';

class NewCardPage extends StatelessWidget {
  final ContainerData containerData;
  const NewCardPage({super.key, required this.containerData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                containerData.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                containerData.imageUrl,
                width: 200,
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
