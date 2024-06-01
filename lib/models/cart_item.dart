import 'package:full_food_delivery_app_with_backend/models/food.dart';

class CardItem{
  Food food;
  List<Addon> selectedAddon;
  int quantity;

  CardItem({
    required this.food,
    required this.selectedAddon,
     this.quantity = 1});

    /*
    How .fold() Works Internally
    The method starts with the initialValue.
    It iterates over each element in the iterable.
    For each element, it applies the combine function, passing in the accumulated value (previousValue) and the current element.
    The result of the combine function becomes the new accumulated value.
    After processing all elements, .fold() returns the final accumulated value.
    The .fold() method is very flexible and powerful, enabling you to reduce an iterable to a single value in various ways based on your requirements.
    Syntax : E fold<E>(E initialValue, E Function(E previousValue, T element) combine)
    Example:
    void main() {
      List<int> numbers = [1, 2, 3, 4, 5];
      int sum = numbers.fold(0, (previousValue, element) => previousValue + element);
      print(sum); // Output: 15
    }
    */

     double get totalPrice {
      double addonPrice = selectedAddon.fold(0,(sum, addon) => sum + addon.price);
      return (food.price + addonPrice) * quantity ; 
}   
  }