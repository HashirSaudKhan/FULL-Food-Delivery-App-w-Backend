import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/pages/login_page.dart';
import 'package:full_food_delivery_app_with_backend/pages/registor_page.dart';

class LoginOrRegistorPage extends StatefulWidget {
  const LoginOrRegistorPage({super.key});

  @override
  State<LoginOrRegistorPage> createState() => _LoginOrRegistorPageState();
}

class _LoginOrRegistorPageState extends State<LoginOrRegistorPage> {


  //Initially, show login page
  bool showLoginPage = true;

  // toggle between login or registor
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegistorPage(onTap: togglePages);
    }
  }
}