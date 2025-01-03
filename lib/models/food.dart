// // food items

// class Food{
//   final String name; // Cheese Burger
//   final String description; // a burger full of cheese
//   final String imagePath; // lib/images/cheese.burger.png
//   final double price; //4.99
//   final FoodCatagories catagory; // burger
//   final List<Addon> availableAddons; // [extra cheese , sauce , extra patty]

//   Food({
//     required this.name,
//     required this.description,
//     required this.imagePath,
//     required this.price,
//     required this.catagory,
//     required this.availableAddons,

//   });

// }

// //Food Catagories
// enum  FoodCatagories{
//   burger,
//   salads,
//   sides,
//   desserts,
//   drinks

// }

// // Food Addons
// class Addon {
//   String name;
//   double price;

//   Addon({
//     required this.name,
//     required this.price
//   });

// }

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCatagories catagory;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.catagory,
    required this.availableAddons,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
      price: json['price'].toDouble(),
      catagory: FoodCatagories.values.firstWhere(
        (e) => e.toString() == 'FoodCatagories.' + json['category'],
        orElse: () => FoodCatagories.burger, // Default category if not found
      ),
      availableAddons: (json['availableAddons'] as List<dynamic>)
          .map((addon) => Addon.fromJson(addon))
          .toList(),
    );
  }
}

class Addon {
  final String name;
  final double price;

  Addon({required this.name, required this.price});

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}

enum FoodCatagories { burger, salads, sides, desserts, drinks }
