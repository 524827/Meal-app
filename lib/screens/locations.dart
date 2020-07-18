import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'Nashik',
              style: Theme.of(context).appBarTheme.textTheme.bodyText1,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Text('candak circle, matoshree nagar',
              style: Theme.of(context).appBarTheme.textTheme.bodyText2),
        )
      ],
    );
  }
}
