import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/components/my_cart_tile.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:full_food_delivery_app_with_backend/pages/payment_page.dart';
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
          actions: [
            IconButton(onPressed: (){
              showDialog(
                context: context, 
                builder: (context) =>  AlertDialog(
                  title: const Text('Are you sure you want to clear the cart'),
                  actions: [

                    //cancel button

                    TextButton(
                      onPressed: ()=> Navigator.pop(context),
                      child: const Text('Cancel')
                      ),

                    //yes
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        restaurant.clearCard();
                        },
                      child: const Text('Yes')
                      ),
                  ],

                ));
            }, icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                    userCart.isEmpty ? 
                      const Expanded(child: Center(child: Text("Cart is empty...")))
                    : Expanded(
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
            ),


            //button to pay 
            MyButton(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const PaymentPage()));
              }, 
              text: 'Go to checkout'
              ),

            const SizedBox(height: 25,),
          ],
        ),
      );
    });
  }
}