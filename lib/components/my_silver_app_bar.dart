import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/pages/cart_page.dart';
class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
    
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      centerTitle: true,
      title: const Text('Sunset Dinner'),
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
          }, 
          icon: const Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(padding: const EdgeInsets.only(bottom: 50),child: child,),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),
      
    );
  }
}