import 'package:flutter/material.dart';


import '../models/meals.dart';
import '../screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });


  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        {
          return 'Simple';
        }
        break;
      case Complexity.Hard:
        {
          return 'Hard';
        }
        break;
      case Complexity.Challenging:
        {
          return 'Hard';
        }
        break;
      default:
        {
          return 'Unknown';
        }
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        {
          return 'Affordable';
        }
        break;
      case Affordability.Pricey:
        {
          return 'Pricey';
        }
        break;
      case Affordability.Luxurious:
        {
          return 'Luxurious';
        }
        break;
      default:
        {
          return 'Unknown';
        }
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments:id);
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 50,
                  child: Container(
                    color: Colors.black54,
                    width: 250,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kurale'),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilityText')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
