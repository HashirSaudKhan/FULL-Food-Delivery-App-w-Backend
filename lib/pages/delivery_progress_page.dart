import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_receipt.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:full_food_delivery_app_with_backend/services/database/firestore_options.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get acces to db 
  FirestoreServices db = FirestoreServices();


  @override
  void initState(){
    super.initState();

    //if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
    /*
    context.read<T>() ek Flutter ka feature hai jo Flutter ki Provider library ke saath aata hai.
    Ye ek tarah ka "dependency injection" mechanism provide karta hai.
    Dependency injection ka matlab hai ki aap kisi class ya object ko kisi dusre class ya function mein inject kar sakte hain, taaki wo class ya function us object ki properties ya methods ka use kar sake.

    context.read<T>() ka use karte waqt, aap apne widget tree ke context se T type ka object retrieve 
    kar sakte hain. Yeh object aapne pehle Provider ke zariye provide kiya hota hai.

    Is tareeke se, aap apne widget tree ke kisi bhi level se kisi bhi 
    class ya object ko access kar sakte hain, bina directly widget tree ko traverse kiye.

    Yeh ek bahut powerful technique hai jo Flutter mein state management aur code organization 
    ko simplify karta hai. Iske use se aap apne code ko modular bana sakte hain 
    aur code ko easily maintainable banane mein madad milti hai.
    */
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: const Text("Delivery in Progress.."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottonNavBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt()
          ],),
      ),
    );


  }

    //Custom Bottom Nav Bar - Message / call delivery driver
    Widget _buildBottonNavBar(BuildContext context){
      return Container(
        height: 100,
        decoration: BoxDecoration(
          color:  Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          ),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            //profile pic of the driver
          Container(
            decoration: BoxDecoration(
            color:  Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){},),
          ),

          const SizedBox(width: 10,),

          //driver details 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hashir Saud Khan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,              
              ),),

              Text("Driver",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,              
              ),)
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
          Container(
            decoration: BoxDecoration(
            color:  Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle
            ),
            child: IconButton(
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.message),
              onPressed: (){},),
          ),

          const SizedBox(width: 10,),
          //call button 
          Container(
            decoration: BoxDecoration(
            color:  Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle
            ),
            child: IconButton(
              color: Colors.green,
              icon: const Icon(Icons.call),
              onPressed: (){},),
          )
          



            ],
          ) 
        ],),
      );


    }
}