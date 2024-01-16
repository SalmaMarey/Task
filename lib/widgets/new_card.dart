import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tash_provider/provider/card_notifier.dart';

import '../models/container_data.dart';

class NewCardPage extends StatelessWidget {
  final ContainerData containerData;
  const NewCardPage({super.key, required this.containerData});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(containerData.id),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          Provider.of<CardNotifer>(context, listen: false)
              .deleteData(containerData.id);
          Provider.of<CardNotifer>(context, listen: false).decreaseBadgeCount();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                width: 250,
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
                    CachedNetworkImage(
                      imageUrl: containerData.imageUrl,
                      width: 200,
                      height: 150,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(25), color: Colors.grey),
              //   child: IconButton(
              //     onPressed: () {
              //       Provider.of<CardNotifer>(context, listen: false)
              //           .deleteData(containerData.id);

              //       Provider.of<CardNotifer>(context, listen: false)
              //           .decreaseBadgeCount();
              //     },
              //     icon: const Icon(
              //       Icons.delete,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
