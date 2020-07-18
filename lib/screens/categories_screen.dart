import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../widgets/category_list.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return GridView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((item) {
            return CategoryList(item.id,item.title);
          })
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 170,
            childAspectRatio: constraints.widthConstraints().maxWidth / constraints.heightConstraints().maxHeight,
            crossAxisSpacing: 10,
            
            mainAxisSpacing: 10,),
      );
    });
  }
}
