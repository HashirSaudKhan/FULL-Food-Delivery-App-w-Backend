import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/auth/login_or_registor_page.dart';
import 'package:full_food_delivery_app_with_backend/models/restaurant.dart';
import 'package:full_food_delivery_app_with_backend/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(providers: [
      //theme provider 
      ChangeNotifierProvider(create: (_)=> ThemeProvider()),
      
      //restaurant provider
      ChangeNotifierProvider(create: (_)=> Restaurant())
    ],
    child: const MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const LoginOrRegistorPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}