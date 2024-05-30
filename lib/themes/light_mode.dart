import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    //background:Colors.grey.shade300 ,
    // We use surface instead of background
    
    surface: Colors.grey.shade300 , 
    primary:Colors.grey.shade500,
    secondary: Colors.grey.shade100, 
    tertiaryContainer: Colors.white,
    inversePrimary: Colors.grey.shade700
    )
);