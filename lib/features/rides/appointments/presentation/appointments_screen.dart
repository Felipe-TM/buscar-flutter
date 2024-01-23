import 'package:flutter/material.dart';

import 'appointment_tile.dart';
import 'appointments_filters.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 90),
                child: Column(
                  children: [
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'Av. Juscelino Kubitscheck, 3080',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. Geraldo Francisco dos Santos',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListFilters(),
        ],
      ),
    );
  }
}
