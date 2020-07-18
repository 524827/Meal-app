import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'About',
          style: TextStyle(
              color: Color(0xFFFC8019), fontSize: 20, fontFamily: 'Kurale'),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
