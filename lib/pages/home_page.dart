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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize tab controller with the length of food categories
    _tabController =
        TabController(length: FoodCatagories.values.length, vsync: this);

    // Fetch menu from the server when the page is loaded
    Provider.of<Restaurant>(context, listen: false).fetchMenu();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(
      FoodCatagories category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.catagory == category).toList();
  }

  // Return list of foods in the given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCatagories.values.map((category) {
      // Get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // Get individual food
          final food = categoryMenu[index];

          // Return food tile
          return FoodTile(food: food, onTap: () {});
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // My Current location
                MyCurrentLocation(),
                // Description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            // Ensure the menu is loaded before showing the TabBarView
            if (restaurant.menu.isEmpty) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loading indicator
            }

            // Show TabBarView with food categories
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            );
          },
        ),
      ),
    );
  }
}
