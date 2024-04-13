import 'package:flutter/material.dart';
import 'package:latihan_navigator/anim/quote_detail_page.dart';
import 'package:latihan_navigator/model/quote.dart';
import 'package:latihan_navigator/screen/form_screen.dart';
import 'package:latihan_navigator/screen/quote_detail_screen.dart';
import 'package:latihan_navigator/screen/quote_list_screen.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  String? selectedQuote;

  bool isForm = false;

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
            toFormScreen: () {
              isForm = true;
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
        if (isForm)
          MaterialPage(
            key: const ValueKey('FormPage'),
            child: FormScreen(
              onSend: () {
                isForm = false;
                notifyListeners();
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        selectedQuote = null;
        isForm = false;
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
