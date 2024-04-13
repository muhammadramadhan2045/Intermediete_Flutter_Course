import 'package:flutter/material.dart';
import 'package:latihan_navigator/model/quote.dart';
import 'package:latihan_navigator/screen/quote_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuoteListScreen(quotes: quotes),
    );
  }
}
