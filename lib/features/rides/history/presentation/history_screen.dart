import 'package:flutter/material.dart';

import 'history_filters.dart';
import 'history_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              HistoryListTile(
                  origin: 'Av. Juscelino Kubitscheck, 3080',
                  destination: 'R. João Ruíz, 290',
                  rideRating: '4,6',
                  date: '02/01/2024'),
              HistoryListTile(
                  origin: 'R. Midori Koga, 50',
                  destination: 'Alameda Miguel Blasi, 96',
                  rideRating: '5,0',
                  date: '26/12/2023'),
              HistoryListTile(
                  origin: 'R. Geraldo Francisco dos Santos , 134',
                  destination: 'R. Chefe Newton, 227',
                  rideRating: '4,2',
                  date: '29/12/2023'),
              HistoryListTile(
                  origin: 'Av. Henrique Mansano, 961',
                  destination: 'R. Amendoinzeiro, 942',
                  rideRating: '3,0',
                  date: '22//12/2023'),
              HistoryListTile(
                  origin: 'R. Sen. Souza Naves, 2883',
                  destination: 'Av. Me. Leônia Milito, 123',
                  rideRating: '1,0',
                  date: '15/12/2023'),
            ],
          ),
          const HistoryFilters(),
        ],
      ),
    );
  }
}
