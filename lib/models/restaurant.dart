import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/cart_item.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class Restaurant extends ChangeNotifier {
  //Lists of food menu

  final List<Food> _menu = [
    //burgers
    Food(
        name: 'Classic Cheeseburger',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/—Pngtree—juicy burgers with a transparent_9002761.png',
        price: 0.99,
        catagory: FoodCatagories.burger,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'BBQ Bacon Burger',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/—Pngtree—juicy burgers with a transparent_9002761.png',
        price: 0.99,
        catagory: FoodCatagories.burger,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Veggie Burger',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/burger_2.jpg',
        price: 0.99,
        catagory: FoodCatagories.burger,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Aloha Burger',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/burger_3.jpg',
        price: 0.99,
        catagory: FoodCatagories.burger,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Blue Moon Burger',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/burger_3.jpg',
        price: 0.99,
        catagory: FoodCatagories.burger,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),

    //salads
    Food(
        name: 'Ceaser Salad',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/salads/salad_1.png',
        price: 0.99,
        catagory: FoodCatagories.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Greek Salad',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/salads/salad_2.png',
        price: 0.99,
        catagory: FoodCatagories.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Quinoa Salad',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/salads/salad_3.png',
        price: 0.99,
        catagory: FoodCatagories.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Asian Sesame Salad',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/salads/salad_4.png',
        price: 0.99,
        catagory: FoodCatagories.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'South West Chicken Salad',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/salads/salad_5.png',
        price: 0.99,
        catagory: FoodCatagories.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),

    //sides
    Food(
        name: 'Classic Sides',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic Sides',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic Sides',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic Sides',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic Sides',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),

    //desserts
    Food(
        name: 'Classic desserts',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic desserts',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic desserts',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic desserts',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'Classic desserts',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),

    //drinks
    Food(
        name: 'drinks',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'drinks',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'drinks',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'drinks',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
    Food(
        name: 'drinks',
        description:
            'A juicy patty with melted chedder, lettuce, tomato, and a hint of onion and pickle.',
        imagePath:
            'lib/images/burgers/food-photographer-E94j3rMcxlw-unsplash.jpg',
        price: 0.99,
        catagory: FoodCatagories.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacin', price: 0.99),
          Addon(name: 'Avocado', price: 0.99),
        ]),
  ];


  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CardItem> get cart => _cart;

  /*
  O P E R A T I O N S
  */

  //User cart
  final List<CardItem> _cart = [];


  // add to cart
  
  void addToCart(Food food,List<Addon> selectedAddon){
    // see if there is a cart item already eith the same food and selected addons
    CardItem? cartItem = _cart.firstWhereOrNull((item){
      //check if the food items are the same 
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddon, selectedAddon);

      return isSameFood && isSameAddons;
    
    });

    // if item already exists, increase it's quantity
    if(cartItem != null){
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart 
    else{
      _cart.add(
        CardItem(
          food: food, 
          selectedAddon: selectedAddon)
      );
    }

    notifyListeners();
  }


  // remove from cart

  void removeFromCart(CardItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    
    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }

    }
    notifyListeners();
  }

  // get total price of cart 
  double getTotalPrice() {
    double total = 0.0;

    for (CardItem cardItem in _cart){
      double itemTotal = cardItem.food.price;
      
      for (Addon addon in cardItem.selectedAddon){
        itemTotal += addon.price;
      }
    }
    return total;
    
  }


  // get total number of items in cart

  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CardItem cardItem in _cart){
      totalItemCount += cardItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCard(){
    _cart.clear();
    notifyListeners();
  }
  /*
   H E L P E R S
  */

  // generate a receipt

  // format double value into money 

  // format list of addons into a string summary 
}
