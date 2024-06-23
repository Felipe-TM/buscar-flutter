import 'package:flutter/material.dart';
import 'package:buscar/features/rides/ride_details/presentation/ride_details_screen.dart'; // Importe a tela RideDetailsScreen

class RequestTile extends StatelessWidget {
  final String origin;
  final String destination;
  final String date;
  final String passangerRequests;
  final bool isPending;

  const RequestTile({
    Key? key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.passangerRequests,
    this.isPending = false,
  }) : super(key: key); // Ajuste para receber a chave key e passar para o super

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.home,
            size: 22,
          ),
          Expanded(
            child: Text(
              'De: $origin',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isPending)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Icon(Icons.info_outline, color: Colors.orange),
                ),
                const Text(
                  'Pendente',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5, left: 5),
                child: Icon(Icons.group),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    passangerRequests,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.place,
              size: 20,
            ),
            Expanded(
              child: Text(
                'Para: $destination',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(date)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RideDetailsScreen(); // Navega para RideDetailsScreen ao clicar no tile
            },
          ),
        );
      },
    );
  }
}
