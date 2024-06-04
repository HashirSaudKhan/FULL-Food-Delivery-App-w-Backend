import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/pages/home_page.dart';
import 'package:full_food_delivery_app_with_backend/services/auth/login_or_registor_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user is logged in 
          if(snapshot.hasData){
            return const HomePage();
          }

          //user not logged in 
          else {
            return const LoginOrRegistorPage();
          }
        },),
    );
  }
}