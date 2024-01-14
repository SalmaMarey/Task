import 'package:flutter/material.dart';

class CardNotifer extends ChangeNotifier {
  int _badgeCount = 0;

  int get badgeCount => _badgeCount;

  void increaseBadgeCount() {
    _badgeCount++;
    notifyListeners();
  }

  final List<ContainerData> _data = [];
  List<ContainerData> get getdata {
    return _data;
  }

  void addData(ContainerData containerData) {
    _data.add(containerData);
    notifyListeners();
  }
}

class ContainerData {
  final String title;
  final String imageUrl;

  ContainerData({required this.title, required this.imageUrl});
}

void addData(String imageUrl, String title) {}
