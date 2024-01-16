import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tash_provider/provider/card_notifier.dart';
import 'package:tash_provider/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardNotifer>(
        create: (BuildContext context) => CardNotifer(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
