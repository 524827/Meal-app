import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class Setting extends StatefulWidget {


  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Setting',
            style: TextStyle(
                color: Color(0xFFFC8019), fontSize: 20, fontFamily: 'Kurale')),
      ),
      drawer: AppDrawer(),
    );
  }
}
