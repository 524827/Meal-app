import 'package:flutter/material.dart';

import '../screens/category_meals.dart';
import '../models/argument.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;

  CategoryList(this.id,this.title);

  void selectCategory(BuildContext context) {
    //Navigator.of(context).pop();
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: ScreenArguments(id, title));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/indian4.jpg'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                // color: Color(0xFFFFFFFF).withOpacity(0.8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
