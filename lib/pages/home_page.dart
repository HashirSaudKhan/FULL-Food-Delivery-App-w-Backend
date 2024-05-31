import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_current_location.dart';
import 'package:full_food_delivery_app_with_backend/components/my_description_box.dart';
import 'package:full_food_delivery_app_with_backend/components/my_drawer.dart';
import 'package:full_food_delivery_app_with_backend/components/my_food_tile.dart';
import 'package:full_food_delivery_app_with_backend/components/my_silver_app_bar.dart';
import 'package:full_food_delivery_app_with_backend/components/my_tab_bar.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  //tab Controller
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: FoodCatagories.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }


  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCatagories category , List<Food> fullMenu){
    return fullMenu.where((food)=> food.catagory == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCatagories.values.map(
      (category){
      //get category menu
      List<Food> catagoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: catagoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          //get individual food
          final food = catagoryMenu[index];

          //return food tile
          return FoodTile(food: food, onTap: (){});
        },
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      drawer: const MyDrawer(),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                //My Current location
                const MyCurrentLocation(),

                // Description box
                const MyDescriptionBox(),
            ],) )
        ],
        body:  Consumer<Restaurant>(
            //Tab bar view
            builder: (context,restaurant,child) => 
            TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu))),
          ),
    );
  }
}