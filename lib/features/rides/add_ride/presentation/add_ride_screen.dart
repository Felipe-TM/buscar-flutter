import 'package:flutter/material.dart';

class AddRideScreen extends StatelessWidget {
  const AddRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oferecendo Carona'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
