import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ContainerData {
  final String id;
  final String title;
  final String imageUrl;

  ContainerData(
      {required this.title, required this.imageUrl, required String? id})
      : id = id ?? uuid.v4();
}

void addData(String imageUrl, String title) {}

void deleteData(
  String id,
) {}
