import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // test food details
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name),
                    Text(
                      '\$${food.price}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      food.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    )
                  ],
                )),

                const SizedBox(
                  width: 15,
                ),

                //food Image
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      food.imagePath,
                      height: 120,
                    ))
              ],
            ),
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.tertiary,
        )
      ],
    );
  }
}
