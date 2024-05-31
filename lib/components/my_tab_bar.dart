import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({
    super.key,
    required this.tabController});

  List<Tab> _buildCategoryTabs(){
    /*FoodCatagories.values provides an iterable of all the values in the FoodCatagories enum. For example, 
    [FoodCatagories.burger, FoodCatagories.salads, FoodCatagories.sides, FoodCatagories.desserts, FoodCatagories.drinks]
    */

    //.map()
    /* 
    The .map() method takes a function as an argument. 
    This function will be applied to each element of the iterable (FoodCatagories.values).
    In this example, the function (category) { return Tab(...) } takes each category 
    (which is an enum value) and transforms it into a Tab widget.
    */

    return FoodCatagories.values.map(
      (category){
        return Tab(
          /*
          category.toString() converts the enum value to a string, e.g., FoodCatagories.burger.
          .split('.') splits the string at the period, resulting in ["FoodCatagories", "burger"].
          .last takes the last element of the split array, which is the category name ("burger").
          Tab(text: ...) creates a new Tab widget with the text set to the category name.
          */
          text: category.toString().split('.').last,
        );

        /*
        The .map() method returns an iterable of the transformed elements (Tab widgets in this case).e.g
        (Tab(text: 'burger'), Tab(text: 'salads'), Tab(text: 'sides'), Tab(text: 'desserts'), Tab(text: 'drinks'))
        .toList() converts this iterable into a list.
        [Tab(text: 'burger'), Tab(text: 'salads'), Tab(text: 'sides'), Tab(text: 'desserts'), Tab(text: 'drinks')]
        */

      }).toList();

      /*
      For FoodCatagories.burger:
      category.toString() -> "FoodCatagories.burger"
      .split('.') -> ["FoodCatagories", "burger"]
      .last -> "burger"
      Tab(text: 'burger') creates a Tab widget with the text "burger".
      */
  }

  @override
  Widget build(BuildContext context) {

    return  TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs()
      
      );
  }
}