import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_cart_tile.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context,restaurant,child){
      //cart
      final userCart = restaurant.cart;

      //Scaffold UI
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userCart.length,
                  itemBuilder: (context,index){
                
                    //get individual cart item 
                    final cartItem = userCart[index];
                    
                    // return card tile UI
                    return ListTile(

                      title: MyCartTile(cartItem: cartItem,),
                    );
                  }),
              )
          ],
        ),
      );
    });
  }
}