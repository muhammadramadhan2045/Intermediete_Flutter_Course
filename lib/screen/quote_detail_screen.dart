import 'package:flutter/material.dart';
import 'package:latihan_navigator/model/quote.dart';

class QuoteDetailScreen extends StatelessWidget {
  final String quoteId;
  const QuoteDetailScreen({super.key, required this.quoteId});

  @override
  Widget build(BuildContext context) {
    final quote = quotes.singleWhere((element) => element.id == quoteId);
    return Scaffold(
      appBar: AppBar(
        title: Text(quote.author),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quote.author, style: Theme.of(context).textTheme.titleLarge),
            Text(quote.quote, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
