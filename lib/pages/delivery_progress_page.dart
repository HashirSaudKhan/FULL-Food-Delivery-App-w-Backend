import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Delivery in Progress.."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottonNavBar(context),
      body: const Column(
        children: [
          MyReceipt()
        ],),
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