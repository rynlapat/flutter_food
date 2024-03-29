import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_list_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodMainPageState createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      body: _selectedBottomNavIndex == 0
          ? FoodListPage()
          : Container(
        child: Center(
          child: Text('YOUR ORDER',
              style: Theme.of(context).textTheme.headline1),
        ),
      ),
    );
  }
}