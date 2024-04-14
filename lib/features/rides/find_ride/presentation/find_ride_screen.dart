import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'find_ride_page1.dart';
import 'find_ride_page2.dart';
import 'find_ride_page4.dart';

class FindRideScreen extends StatelessWidget {
  const FindRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Procurando Carona'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: TabBarView(
            children: [
              const FindRidePage1(),
              SingleChildScrollView(
                child: FindRidePage2(
                  onBack: () {
                    DefaultTabController.of(context).animateTo(0);
                  },
                  onNext: () {
                    DefaultTabController.of(context).animateTo(2);
                  },
                ),
              ),
              const FindRidePage3(),
              const FindRidePage4(
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
            ],
          ),
          bottomNavigationBar: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.map_outlined),
            ),
            Tab(
              icon: Icon(Icons.list_alt),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.check_sharp),
            )
          ]),
        );
      }),
    );
  }
}

class FindRidePage3 extends StatelessWidget {
  const FindRidePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMapWidget();
  }
}
