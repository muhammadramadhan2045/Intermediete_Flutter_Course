import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_list_app/screen/home_screen.dart';
import 'package:quote_list_app/service/asset_service.dart';

import 'provider/asset_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(
        AssetService(),
      ),
      child: MaterialApp(
        title: 'Quote List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
