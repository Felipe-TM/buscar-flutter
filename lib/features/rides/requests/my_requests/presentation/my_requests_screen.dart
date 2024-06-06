import 'package:buscar/features/rides/requests/my_requests/presentation/request_tile.dart';
import 'package:flutter/material.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

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
              origin: Text('Rua Orlando Silva, 845'),
              destination: Text('Rua General Horta Barbosa, 123'),
              date: Text('12/12/2026'),
              status: Text('Pendente'),
              isLoading: true,
            )
          ],
        ),
      ),
    );
  }
}
