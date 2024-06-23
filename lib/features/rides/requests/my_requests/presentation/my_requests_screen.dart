import 'package:buscar/features/rides/requests/my_requests/presentation/request_tile.dart';
import 'package:flutter/material.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aceitar Passageiros'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RequestTile(
              origin: const Text('Rua Orlando Silva, 845'),
              destination: const Text('Rua General Horta Barbosa, 123'),
              date: const Text('12/12/2026'),
              status: const Text('Pendente'),
              isLoading: false,
              onAccept: () => _showAcceptDialog(context), // Adicionar callback onAccept
            )
          ],
        ),
      ),
    );
  }

  void _showAcceptDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aceitar Passageiro'),
          content: const Text('Você deseja aceitar este passageiro?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Passageiro recusado');
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Passageiro aceito com sucesso');
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyRequestsScreen(),
  ));
}
