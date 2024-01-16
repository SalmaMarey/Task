import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/container_data.dart';
import '../provider/card_notifier.dart';

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
                const SizedBox(
                  width: 30,
                ),

                Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Consumer<CardNotifer>(
                          builder: (salma, sakr, _) => IconButton(
                            onPressed: () {
                              sakr.badgeCount > 0
                                  ? Provider.of<CardNotifer>(context,
                                          listen: false)
                                      .decreaseBadgeCount()
                                  : null;
                              Provider.of<CardNotifer>(context, listen: false)
                                  .deleteData(containerData.id);
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Consumer<CardNotifer>(
                      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      builder: (context, CardNotifer, _) =>
                          CardNotifer.badgeCount > 0
                              ? Text(
                                  CardNotifer.badgeCount.toString(),
                                  style: const TextStyle(fontSize: 25),
                                )
                              : const Text(
                                  '0',
                                  style: TextStyle(fontSize: 25),
                                ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Provider.of<CardNotifer>(context, listen: false)
                                .addData(containerData);

                            Provider.of<CardNotifer>(context, listen: false)
                                .increaseBadgeCount();
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 45),
                // ElevatedButton(
                //   onPressed: () {
                //     Provider.of<CardNotifer>(context, listen: false)
                //         .addData(containerData);

                //     Provider.of<CardNotifer>(context, listen: false)
                //         .increaseBadgeCount();
                //   },
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.black,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(2),
                //       )),
                //   child: const Text(
                //     'Add to Cart',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
