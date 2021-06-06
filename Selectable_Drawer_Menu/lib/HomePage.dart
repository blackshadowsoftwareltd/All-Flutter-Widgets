import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select/pages/dashboard.dart';
import 'package:select/pages/people.dart';
import 'NavigationDrawers.dart';
import 'Service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentItem = context.watch<Services>().getNavigationItems;

    switch (currentItem) {
      case NavigationItems.dashboard:
        return DashBoard();
      case NavigationItems.people:
        return PeoPle();
    }
  }
}
