import 'package:buscar/common_widgets/custom_card.dart';
import 'package:buscar/features/rides/requests/accept_passanger/presentation/accept_passanger_screen.dart';
import 'package:buscar/features/rides/requests/my_requests/presentation/my_requests_screen.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                CustomCard(
                  color: Colors.blue.shade300,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AcceptPassangerScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Minhas Solicitações',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_taxi,
                            size: 42,
                          ),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 42,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyRequestsScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Aceitar Passageiros',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.group,
                            size: 42,
                          ),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 42,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]
                  .map(
                    (widget) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: widget,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
