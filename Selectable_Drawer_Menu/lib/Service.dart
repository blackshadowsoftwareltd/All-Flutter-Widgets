import 'package:flutter/cupertino.dart';

enum NavigationItems {
  dashboard,
  people,
  favourites,
  updates,
  notifications,
}

class Services extends ChangeNotifier {
  NavigationItems _navigationItems = NavigationItems.dashboard;
  NavigationItems get getNavigationItems => _navigationItems;

  void setNav(NavigationItems items) {
    _navigationItems = items;
    notifyListeners();
  }
}
