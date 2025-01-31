//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/models/cart_item.dart';
import 'package:full_food_delivery_app_with_backend/models/food.dart';
import 'package:full_food_delivery_app_with_backend/models/food_service.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //Lists of food menu

  List<Food> _menu = []; // Private variable to hold the list of foods
  List<Food> burgers = [];
  List<Food> drinks = [];
  List<Food> salads = [];
  List<Food> sides = [];
  List<Food> desserts = [];

  // Method to fetch the menu
  Future<void> fetchMenu() async {
    try {
      burgers = await FoodService.fetchBurgers();
      drinks = await FoodService.fetchDrinks();
      salads = await FoodService.fetchSalads();
      desserts = await FoodService.fetchDesserts();
      sides = await FoodService.fetchSides();
      _menu = burgers + drinks + salads + desserts + sides;
      notifyListeners(); // Notify listeners (widgets) to update the UI
    } catch (error) {
      print('Error fetching menu: $error');
    }
  }

  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CardItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P E R A T I O N S
  */

  //User cart
  final List<CardItem> _cart = [];

  //delivery address (which user can change/update)
  String _deliveryAddress = "Rc_39 Khuramabad";

  // add to cart

  void addToCart(Food food, List<Addon> selectedAddon) {
    // see if there is a cart item already eith the same food and selected addons
    CardItem? cartItem = _cart.firstWhereOrNull((item) {
      /*
      .firstWhereOrNull():
      Yeh function ek collection mein se pahla element return karta hai jo ek specific condition 
      ko satisfy karta hai.
      Agar koi element nahi milta jo condition ko satisfy karta hai, to yeh null return karta hai.
      Example of higher-order functions firstWhereOrNull :
      List<int> numbers = [1, 2, 3, 4, 5];
      int firstEvenNumber = numbers.firstWhereOrNull((element) => element % 2 == 0);
      print(firstEvenNumber); 
      */
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddon, selectedAddon);

      /*
      equals(item.selectedAddon, selectedAddon): Yeh "ListEquality" object ka "equals" 
      method hai jo do lists ko compare karta hai aur yeh return karta hai ke kya woh ek jaise hain ya nahi.
      example :
      List<String> list1 = ["apple", "banana", "orange"];
      List<String> list2 = ["apple", "banana", "orange"];

      bool isSame = const ListEquality().equals(list1, list2);
      print(isSame); // Output: true

      */

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(CardItem(food: food, selectedAddon: selectedAddon));
    }

    notifyListeners();
  }

  // remove from cart

  void removeFromCart(CardItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    /*
      Example of indexof();
      List<String> fruits = ["apple", "banana", "cherry", "banana"];

      int appleIndex = fruits.indexOf("apple"); 
      int secondBananaIndex = fruits.indexOf("banana", 1); // Start search from index 1

      print(appleIndex); // Output: 0
      print(secondBananaIndex); // Output: 3 (index of the second "banana")
    */

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CardItem cardItem in _cart) {
      double itemTotal = cardItem.food.price;

      for (Addon addon in cardItem.selectedAddon) {
        itemTotal += addon.price;
      }
      total += itemTotal;
    }
    return total;
  }

  // get total number of items in cart

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CardItem cardItem in _cart) {
      totalItemCount += cardItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCard() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
   H E L P E R S
  */

  // generate a receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    /*
    StringBuffer class Dart mein mutable strings ko efficiently concatenate karne ke liye use hoti hai. 
    Yeh especially useful hai jab aapko ek string ko dynamically build karna ho, 
    jaise ke ek receipt ya report generate karte waqt.
    */

    receipt.writeln("Here's your receipt");
    /*
    receipt.writeln("Here's your receipt");: writeln method ek line ko string buffer mein 
    add karta hai aur automatically ek newline character (\n) bhi insert karta hai. Is line mein,
    "Here's your receipt" string buffer mein add kiya jata hai aur newline character bhi append hota hai.
    */
    receipt.writeln();

    //format the date to include up to second only
    //convert date to string here
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    /*
    DateFormat() class Dart ke intl package mein define ki gayi hai. intl package, 
    Internationalization (i18n) aur Localization (l10n) ke liye use hota hai.
    Yeh package date, time, numbers, aur messages ko locale-specific format mein handle
    karne ki sahulat provide karta hai.
    */
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddon.isNotEmpty) {
        receipt.writeln("Add-ons : ${_formatAddons(cartItem.selectedAddon)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money

  String _formatPrice(double price) {
    //fixed price upto 2 decimal places
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")

        /*Example of map():
    Yeh function ek collection ke har element ko ek function se apply karta hai aur
    ek naya collection return karta hai. Naye collection mein har element original 
    collection ke corresponding element ke function se apply hone ke baad ka result hota hai.

      List<String> names = ["Alice", "Bob", "Charlie"];
      List<String> upperCaseNames = names.map((name) => name.toUpperCase());
      print(upperCaseNames); // Output: ["ALICE", "BOB", "CHARLIE"]
    */
        .join(", ");
  }
}
