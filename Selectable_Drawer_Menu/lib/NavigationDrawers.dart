import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select/Service.dart';

class NavigationDrawers extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[900],
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              navItem(context, NavigationItems.dashboard, 'DashBoard'),
              navItem(context, NavigationItems.people, 'People'),
              navItem(context, NavigationItems.favourites, 'Favourites'),
              navItem(context, NavigationItems.updates, 'Updates'),
              navItem(context, NavigationItems.notifications, 'Notifications'),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(BuildContext context, NavigationItems item, String name) {
    final currentItem = context.watch<Services>().getNavigationItems;
    bool isSelected = item == currentItem;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white.withOpacity(.1),
        title: Text(name, style: TextStyle(color: Colors.white)),
        onTap: (){ context.read<Services>().setNav(item);
        Navigator.pop(context);
        },
      ),
    );
  }
}
