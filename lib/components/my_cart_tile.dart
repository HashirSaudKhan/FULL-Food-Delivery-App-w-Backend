import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/cart_item.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CardItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context,restaurant,child){
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,),
                  ),

                  //name and price 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(cartItem.food.name),

                      //food price
                      Text('\$${cartItem.food.price.toString()}')
                    ],
                  )

                  //increment or decrement quantity
                ],
              )
            ],),
        );
    } ,);
  }
}