import 'package:flutter/material.dart';
import 'package:latihan_navigator/model/quote.dart';
import 'package:latihan_navigator/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class QuoteListScreen extends StatelessWidget {
  final List<Quote> quotes;
  final Function(String) onTapped;
  final Function() onLogout;
  const QuoteListScreen({
    super.key,
    required this.quotes,
    required this.onTapped,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final authWatch = context.watch<AuthProvider>();
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
              onTap: () {
                onTapped(quote.id);
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final auhtRead = context.read<AuthProvider>();
          final result = await auhtRead.logout();
          if (result) {
            onLogout();
          }
        },
        tooltip: 'Logout',
        child: authWatch.isLoadingLogout
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Icon(Icons.logout),
      ),
    );
  }
}
