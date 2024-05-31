// food items

class Food{
  final String name; // Cheese Burger
  final String description; // a burger full of cheese
  final String imagePath; // lib/images/cheese.burger.png
  final double price; //4.99
  final FoodCatagories catagory; // burger
  final List<Addon> availableAddons; // [extra cheese , sauce , extra patty]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.catagory,
    required this.availableAddons,

  });

}

//Food Catagories
enum  FoodCatagories{
  burger,
  salads,
  sides,
  desserts,
  drinks

}

// Food Addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });

}

