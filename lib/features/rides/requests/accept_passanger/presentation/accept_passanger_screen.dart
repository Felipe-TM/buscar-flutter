import 'package:buscar/features/rides/requests/accept_passanger/presentation/request_tile.dart';
import 'package:flutter/material.dart';

class AcceptPassangerScreen extends StatelessWidget {
  const AcceptPassangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações de Passageiros'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RequestTile(
                origin: 'Rua Orlando Silva, 845',
                destination: 'Rua General Horta Barbosa, 123',
                date: '12/12/2026',
                passangerRequests: '2'),
          ],
        ),
      ),
    );
  }
}
