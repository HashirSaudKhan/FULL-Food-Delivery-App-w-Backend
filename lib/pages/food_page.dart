import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  const FoodPage({
    super.key,
    required this.food
    });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //food image        
          Image.asset(widget.food.imagePath),

         Padding(
           padding: const EdgeInsets.all(25.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               //food name
            Text(
              widget.food.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
            ),),
           
            //food description
            Text(widget.food.description,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary

            ),),
           
            //addons
           
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.food.availableAddons.length,
              itemBuilder: (context,index){
                // get individual addon
                Addon addon = widget.food.availableAddons[index];
                return CheckboxListTile(
                  title: Text(addon.name),
                  subtitle: Text(addon.price.toString()),
                  value: false 
                , onChanged: (value){});
              })
           
            ],
           ),
         )
          //button -> add to cart
        ],
      ),
    );
  }
}