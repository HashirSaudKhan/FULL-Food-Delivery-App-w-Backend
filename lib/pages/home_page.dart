import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_current_location.dart';
import 'package:full_food_delivery_app_with_backend/components/my_description_box.dart';
import 'package:full_food_delivery_app_with_backend/components/my_drawer.dart';
import 'package:full_food_delivery_app_with_backend/components/my_silver_app_bar.dart';
import 'package:full_food_delivery_app_with_backend/components/my_tab_bar.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
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
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index)=> const Text('First tab items')),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index)=> const Text('Second tab items')),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index)=> const Text('Third tab items')),
          ],),
      ),

    );
  }
}