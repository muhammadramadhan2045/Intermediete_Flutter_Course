import 'package:flutter/material.dart';
import 'package:latihan_navigator/anim/quote_detail_page.dart';
import 'package:latihan_navigator/model/quote.dart';
import 'package:latihan_navigator/screen/quote_detail_screen.dart';
import 'package:latihan_navigator/screen/quote_list_screen.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  String? selectedQuote;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('QuoteListPage'),
          child: QuoteListScreen(
            quotes: quotes,
            onTapped: (quoteId) {
              selectedQuote = quoteId;
              notifyListeners();
            },
          ),
        ),
        if (selectedQuote != null)
          QuoteDetailsPage(
            key: const ValueKey("QuoteDetailPage"),
            child: QuoteDetailScreen(
              quoteId: selectedQuote ?? '',
            ),
          ),
      ],
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        selectedQuote = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
