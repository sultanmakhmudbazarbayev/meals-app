import 'dart:ui';

import 'package:flutter/material.dart';
import 'screens/categories_page.dart';
import 'screens/category_meals_page.dart';
import './screens/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: TextStyle(
              fontSize: 22.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      //home: CategoriesPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        // MealdetailPage.routeName: (ctx) => MealdetailPage(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
      onUnknownRoute: (settings) {
         return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}
