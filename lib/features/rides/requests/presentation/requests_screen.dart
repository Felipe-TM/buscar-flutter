import 'package:flutter/material.dart';
import 'request_tile.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Column(
              children: [
                const RequestTile(
                  name: 'Felipe T.',
                  rating: '5.0',
                  origin: 'Rua Souza Naves, 666',
                  destination: 'Av. São João, 1001',
                  departureTime: '18:45',
                  departureDate: '14/02/2024',
                  status: 'Pendente',
                ),
              ]
                  .map((widget) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
