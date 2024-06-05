import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // Required to initialize date formatting data


class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

String getEstimatedDeliveryTime() {
  // Get the current time
  DateTime now = DateTime.now();
  
  // Add 30 minutes to the current time
  DateTime estimatedDeliveryTime = now.add(const Duration(minutes: 30));
  
  // Format the time
  String formattedTime = DateFormat('hh:mm a').format(estimatedDeliveryTime);
  
  return formattedTime;
}

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25,top:50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your order!"),
            const SizedBox(height: 25,),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Consumer<Restaurant>(
                builder: (context,restaurant,child){
                 return  Text(restaurant.displayCartReceipt());
                }),
            ),
            const SizedBox(height: 25,),
            Text("Estimated delivery time is:${getEstimatedDeliveryTime()}")
          ],
        ),
      ),
      );
  }
}