import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false
    //addon is Addon(name: 'Extra cheese', price: 0.99).
    //selectedAddons[addon] = false adds {Addon(name: 'Extra cheese', price: 0.99): false} to the map.
    for (Addon addon in food.availableAddons) {
      //example
      //var details = {'Usrname':'tom','Password':'pass@123'};
      //details['Uid'] = 'U1oo1';
      //print(details);
      //output : {Usrname: tom, Password: pass@123, Uid: U1oo1}
      selectedAddons[addon] = false;
    }
  }
  /*
  selectedAddons = {
    Addon(name: 'Extra cheese', price: 0.99): false,
    Addon(name: 'Bacon', price: 0.99): false,
    Addon(name: 'Avocado', price: 0.99): false,
    };
  */

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                        ),
                      ),
        
                      //food price
                      Text(
                        '\$${widget.food.price}',
                        style:
                            TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
        
                      const SizedBox(
                        height: 10,
                      ),
        
                      //food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                          //color: Theme.of(context).colorScheme.primary
                        ),
                      ),
        
                      const SizedBox(
                        height: 10,
                      ),
        
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
        
                      const SizedBox(
                        height: 10,
                      ),
                      //food description
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
        
                      //addons
        
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              // get individual addon
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(
                                    '\$${addon.price.toString()}',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.primary),
                                  ),
        
                                  //map_name[key] = value
                                  
                                  //value: widget.selectedAddons[Addon(name: 'Extra cheese', price: 0.99)] // false
                                  //value: widget.selectedAddons[Addon(name: 'Bacon', price: 0.99)] // false
                                  //value: widget.selectedAddons[Addon(name: 'Avocado', price: 0.99)] // false
        
                                  // get individual addon
                                  //Addon addon = widget.food.availableAddons[index];
                                  value: widget.selectedAddons[addon],
        
                                  //Suppose the user checks the "Extra cheese" checkbox.
                                  //The onChanged callback is executed with value set to true.
                                  //widget.selectedAddons[Addon(name: 'Extra cheese', price: 0.99)] = true;
        
                                  onChanged: (value) {
                                    setState(() {
                                      // get individual addon
                                      //Addon addon = widget.food.availableAddons[index];
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      )
                    ],
                  ),
                ),
        
                //button -> add to cart
                MyButton(onTap: () {}, text: 'Add to cart'),
        
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      
      // Back Button
      SafeArea(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: (){
                Navigator.pop(context);
              },),
          ),
        ),
      )
      ],
    );
  }
}
