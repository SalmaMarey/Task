import 'package:flutter/material.dart';

import '../models/container_data.dart';

class CardNotifer extends ChangeNotifier {
  int _badgeCount = 0;

  int get badgeCount => _badgeCount;

  void increaseBadgeCount() {
    _badgeCount++;
    notifyListeners();
  }

  void decreaseBadgeCount() {
    _badgeCount--;
    notifyListeners();
  }

  final List<ContainerData> _homeData = [
    ContainerData(
        title: "Red Bag",
        imageUrl:
            "https://www.freepngimg.com/thumb/bag/34521-8-women-bag-transparent.png",
        id: '1'),
    ContainerData(
        title: "Blue Bag",
        imageUrl:
            "https://i.pinimg.com/originals/55/90/f8/5590f81c88cc0ef5dad6989e04fe3ddd.png",
        id: '2'),
    ContainerData(
        title: "Brown Bag",
        imageUrl:
            "https://d1fzx274w8ulm9.cloudfront.net/73877c7982657d6547f3ad5066520b20.png",
        id: '3'),
    ContainerData(
        title: "Black Bag",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/013/362/726/non_2x/office-handbag-black-free-png.png",
        id: '4'),
    ContainerData(
        title: "Small Bag",
        imageUrl:
            "https://www.pngall.com/wp-content/uploads/4/Brown-Leather-Bag-PNG-HD-Image.png",
        id: '5'),
  ];
  List<ContainerData> get getHomeData {
    return _homeData;
  }

  final List<ContainerData> _data = [];
  List<ContainerData> get getdata {
    return _data;
  }

  void addData(ContainerData containerData) {
    _data.add(containerData);
    notifyListeners();
  }

  void deleteData(String id) {
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
