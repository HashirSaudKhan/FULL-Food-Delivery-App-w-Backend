import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {

  final TextEditingController textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Your Location"),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: "Enter address.."),
              ),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),

                //save button
                MaterialButton(

                  onPressed: () {
                    //update delivery address
                    String newAddress = textController.text;
                    context.read<Restaurant>().updateDeliveryAddress(newAddress);
                    Navigator.pop(context);
                    textController.clear();
                    },
                  child: const Text("Save"),
                )
              ],
            ));
  }

 MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          Row(
            children: [
              //address
              GestureDetector(
                onTap: () => openLocationSearchBox(context),
                child: Consumer<Restaurant>(
                  builder: (context,restaurant,child){
                    return Text(restaurant.deliveryAddress);
                  },
                ),
              ),

              //drop down menu
              const Icon(Icons.keyboard_arrow_down),
            ],
          )
        ],
      ),
    );
  }
}
