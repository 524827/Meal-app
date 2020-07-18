import 'package:flutter/material.dart';

import './screens/category_meals.dart';
import './widgets/bottom_tabs.dart';
import './screens/meal_details.dart';
import './screens/about.dart';
import './screens/filter_screen.dart';
import './screens/setting.dart';
import './dummy_data.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterDate) {
    print(filterDate);
    setState(() {
      _filters = filterDate;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primaryColor: Color(0xFFFC8019),
        accentColor: Color(0xFFFC8019),
        canvasColor: Color.fromRGBO(255, 253, 255, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20, fontFamily: 'Sriracha', color: Colors.green),
              headline5: TextStyle(fontSize: 16, fontFamily: 'Kurale'),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(fontFamily: 'Kurale', fontSize: 17),
                bodyText2: TextStyle(fontFamily: 'Kurale', fontSize: 14),
              ),
          iconTheme: IconThemeData(
            color: Color(0xFFFC8019), //change your color here
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: BottomTabs(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomTabs(),
        '/setting': (ctx) => Setting(),
        '/about': (ctx) => About(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilter),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(),
      },
    );
  }
}
