import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

class FindRideScreen extends StatelessWidget {
  const FindRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Procurando Carona'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const TabBarView(
          children: [
            GoogleMapWidget(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
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
            icon: Icon(Icons.check_sharp),
          )
        ]),
      ),
    );
  }
}
