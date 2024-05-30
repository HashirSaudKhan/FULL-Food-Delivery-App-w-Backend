import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap});

  @override
  Widget build(BuildContext context) {

    //Controllers 
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          //logo 
          Icon(
            Icons.lock_open_rounded,
            size : 100,
            color: Theme.of(context).colorScheme.inversePrimary),
      
            const SizedBox(height: 25,),

          // message app slogan
          Text('Food Delivery App',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary
          ),),
      
          const SizedBox(height: 25,),

          // email textfields
          MyTextfield(controller: emailController, hintText: 'Email', obsecureText: false),
      
          const SizedBox(height: 25,),

          //password textfield
          MyTextfield(controller: passwordController, hintText: 'Password', obsecureText: true),

          const SizedBox(height: 25,),

          //sign in button
          MyButton(onTap: (){}, text: 'Sign In'),

          const SizedBox(height: 25,),
      
          // not a member ? Registor now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Not a member?',style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),

              const SizedBox(width: 4,),
              
            GestureDetector(
                onTap: onTap,
                child: Text('Registor now',style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          )
        ],
      ),
    ),
    );
    
  }
}