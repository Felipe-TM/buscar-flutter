import 'package:flutter/material.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
