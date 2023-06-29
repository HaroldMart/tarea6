import 'package:flutter/material.dart';

class ToolboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Toolbox.png',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            'App de herramientas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Esta es una aplicacion de herramientas para inventar',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}