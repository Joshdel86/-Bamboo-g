import 'package:flutter/material.dart';

class AvailableDrinksScreen extends StatefulWidget {
  const AvailableDrinksScreen({super.key});

  @override
  State<AvailableDrinksScreen> createState() => _AvailableDrinksScreenState();
}

class _AvailableDrinksScreenState extends State<AvailableDrinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Drinks'),
      ),
      
    );
  }
}