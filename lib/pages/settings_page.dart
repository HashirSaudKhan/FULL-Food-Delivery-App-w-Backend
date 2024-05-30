import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_food_delivery_app_with_backend/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10)
            ),
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(25),
            
            child: Row(
              children: [
                // dark mode
                Text(
                  'Dark Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
            
                const Spacer(),

                //switch
                Switch(
                  
                  inactiveThumbColor: Theme.of(context).colorScheme.inversePrimary,
                  value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, onChanged: (value) =>
                    Provider.of<ThemeProvider>(context,listen: false).toggleTheme()
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
