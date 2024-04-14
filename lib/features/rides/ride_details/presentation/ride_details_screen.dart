import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

import 'ride_details_sheet.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Corrida'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Stack(children: [
        GoogleMapWidget(),
        RideDetailsSheet(
          origin: 'R. Sen. Souza Naves, 2883',
          destination: 'Av. Me. Leônia Milito, 123',
          departureTime: '17:32',
          arrivalTime: '18:45',
          rideStatus: 'Em Andamento',
          driverName: 'Bruno',
          carModel: 'Fox',
          carManufacturer: 'VW',
          carPlate: '8HK26S',
        ),
      ]),
    );
  }
}
