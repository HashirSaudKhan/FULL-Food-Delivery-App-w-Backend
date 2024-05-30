import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_current_location.dart';
import 'package:full_food_delivery_app_with_backend/components/my_description_box.dart';
import 'package:full_food_delivery_app_with_backend/components/my_drawer.dart';
import 'package:full_food_delivery_app_with_backend/components/my_silver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      drawer: const MyDrawer(),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: const Text('title'), 
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
        body: Container(color: Colors.lightBlue,),
      ),

    );
  }
}