import 'package:flutter/material.dart';

import '../screens/account.dart';
import '../screens/locations.dart';
import '../screens/search_meal.dart';
import './app_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  List<Widget> _pages = [CategoryScreen(), SearchMeal(), FavoriteScreen(), Account()];
  int _selectedIndex = 0;
  bool _isShow = true;

  void _onItemTapped(BuildContext context, int index) {

     switch (index) {
      case 0:
        {
          _isShow = true;
        }
        break;
      case 1:
        {
          _isShow = false;
        }
        break;
      case 2:
        {
          _isShow = false;
        }
        break;
      case 3:
        {
          _isShow = false;
        }
        break;

      default:
        {
          _isShow = false;
        }
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isShow
          ? AppBar(
              backgroundColor: Colors.white,
              titleSpacing: 1,
              title: Locations(),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Best Offers',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ):null,
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 25,
            ),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 25,
            ),
            title: Text('Account'),
          )
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (int index) {
          _onItemTapped(context, index);
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
