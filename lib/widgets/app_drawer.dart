import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {


  void drawerNavigation(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('namdev'),
            accountEmail: Text('Namdev@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              drawerNavigation(context, '/');
            },
          ),
          ListTile(
              leading: Icon(Icons.filter),
              title: Text('Filter'),
              onTap: () {
                drawerNavigation(context, '/filter');
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                drawerNavigation(context, '/setting');
              }),
        ],
      ),
    );
  }
}
