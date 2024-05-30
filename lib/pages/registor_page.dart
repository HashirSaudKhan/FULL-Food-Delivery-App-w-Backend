import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/components/my_textfield.dart';

class RegistorPage extends StatelessWidget {
  final Function()? onTap;
  const RegistorPage({
    super.key,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
     //Controllers 
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

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
          Text('Let\'s create an account for you',
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

          //Confirm password textfield
          MyTextfield(controller: confirmPassController, hintText: 'Confirm Password', obsecureText: true),

          const SizedBox(height: 25,),

          //sign Up button
          MyButton(onTap: (){}, text: 'Sign Up'),

          const SizedBox(height: 25,),
      
          // already have an account? Login now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('already have an account?',style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),

              const SizedBox(width: 4,),
              
            GestureDetector(
                onTap: onTap,
                child: Text('Login now',style: TextStyle(
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