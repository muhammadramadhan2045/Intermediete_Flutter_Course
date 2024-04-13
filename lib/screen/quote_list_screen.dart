import 'package:flutter/material.dart';
import 'package:latihan_navigator/model/quote.dart';

class QuoteListScreen extends StatelessWidget {
  final List<Quote> quotes;
  const QuoteListScreen({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quotes'),
        ),
        body: ListView(
          children: [
            for (var quote in quotes)
              ListTile(
                title: Text(quote.author),
                subtitle: Text(quote.quote),
                isThreeLine: true,
              ),
          ],
        ));
  }
}
