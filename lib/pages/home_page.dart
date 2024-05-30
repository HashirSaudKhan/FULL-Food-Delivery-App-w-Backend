import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),

      drawer: const MyDrawer(),
    );
  }
}