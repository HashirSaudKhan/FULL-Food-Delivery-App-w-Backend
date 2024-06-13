import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/components/my_button.dart';
import 'package:full_food_delivery_app_with_backend/components/my_textfield.dart';
import 'package:full_food_delivery_app_with_backend/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    //Controllers 
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  //Login method
  void login() async{

    //get instance of auth service
    final _authService = AuthService();

    //try sign in  
    try{
      await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }

    //display any error
    catch(e){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text(e.toString()),
          );
        });
    }

    
    //navigate to home page 
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          //logo 
          Lottie.asset('lib/animations/food_delivery_truck.json',height: 250),
      
            //const SizedBox(height: 25,),

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
          MyButton(onTap: login, text: 'Log In'),

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
                onTap: widget.onTap,
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