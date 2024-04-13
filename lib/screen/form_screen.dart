import 'package:flutter/material.dart';
import 'package:latihan_navigator/routes/page_manager.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  final Function onSend;
  const FormScreen({super.key, required this.onSend});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter your quote',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _textController.text;
                widget.onSend();
                context.read<PageManager>().returnData(name);
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
