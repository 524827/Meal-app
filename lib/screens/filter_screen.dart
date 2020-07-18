import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Map<String, bool> filters;
  final Function setFilter;

  FilterScreen(this.filters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluteneFree = false;
  bool _vagetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gluteneFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vagetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];


    super.initState();
  }

  void selectedFilters() {
    var selectedFilter = {
      'gluten': _gluteneFree,
      'lactose': _lactoseFree,
      'vegetarian': _vagetarian,
      'vegan': _vegan
    };
    //print(selectedFilter);
    widget.setFilter(selectedFilter);
    Navigator.of(context).pop();
  }

  Future<dynamic> createDialog(context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            title: Column(
              children: <Widget>[
                Text(
                  'Saved !!!',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
            content: Text(
              'Filter Apply Successfully',
              textAlign: TextAlign.center,
            ),
            elevation: 7,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: cancelFilter,
              ),
              FlatButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: selectedFilters),
            ],
          );
        });
  }

  void cancelFilter() {
    setState(() {
      _gluteneFree = false;
      _lactoseFree = false;
      _vagetarian = false;
      _vegan = false;
    });
    Navigator.of(context).pop();
  }

  Widget _bulidSwitchesList(value, title, subTitle, currentValue) {
    return SwitchListTile(
      value: value,
      onChanged: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Meals',
          style: TextStyle(
              color: Color(0xFFFC8019), fontSize: 20, fontFamily: 'Kurale'),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(
                icon: Icon(
                  Icons.save,
                  color: Color(0xFFFC8019),
                ),
                onPressed: () {
                  createDialog(context);
                }),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black45,
                indent: 80,
                endIndent: 80,
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _bulidSwitchesList(_gluteneFree, 'Glutene Free',
                    'Only includes Gluting free meals', (newvalue) {
                  setState(() {
                    _gluteneFree = newvalue;
                  });
                }),
                _bulidSwitchesList(_lactoseFree, 'Lactose Free',
                    'Only includes Lactose free meals', (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                }),
                _bulidSwitchesList(
                    _vagetarian, 'Vagetarian', 'Only includes vegitarian meals',
                    (newvalue) {
                  setState(() {
                    _vagetarian = newvalue;
                  });
                }),
                _bulidSwitchesList(_vegan, 'Vegan', 'Only includes vegan meals',
                    (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
