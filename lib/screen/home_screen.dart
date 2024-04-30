import 'package:flutter/material.dart';
import 'package:latihan_map/screen/direction_screen.dart';
import 'package:latihan_map/screen/maps_screen.dart';
import 'package:latihan_map/screen/picker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _pages = [
    "Maps Screen",
    "Picker Screen",
    "Direction Screen",
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: _pages
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    setState(() {
                      _index = _pages.indexWhere((element) => element == e);
                    });
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
      appBar: AppBar(
        title: Text(_pages[_index]),
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          MapScreen(),
          PickerScreen(),
          DirectionScreen(),
        ],
      ),
    );
  }
}
