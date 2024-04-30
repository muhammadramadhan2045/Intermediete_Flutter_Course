import 'package:flutter/material.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker Screen'),
      ),
      body: const Center(
        child: Text(
          'Picker Screen',
        ),
      ),
    );
  }
}
