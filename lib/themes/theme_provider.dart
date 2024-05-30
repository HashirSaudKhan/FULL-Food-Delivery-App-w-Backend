import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/themes/dark_mode.dart';
import 'package:full_food_delivery_app_with_backend/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier{

  // Default theme is set to light mode
  ThemeData _themeData = lightMode;

  // Getter for accessing the current theme data
  ThemeData get themeData => _themeData;

  // Getter for checking if the current theme is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Setter for updating the theme data
  set themeData(ThemeData themeData){
    _themeData = themeData;
  }

  // Method for toggling between light and dark mode
  void toggleTheme(){
    if(_themeData == lightMode){
       themeData = darkMode; // If current theme is light, switch to dark
    }else{
      themeData = lightMode; // If current theme is dark, switch to light
    }
    notifyListeners();
  }
}
