import 'package:buscar/common_widgets/flat_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/google_map_widget.dart';

class FindRideScreen extends StatelessWidget {
  const FindRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procurando Carona'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const GoogleMapWidget(),
      bottomNavigationBar: const RideBottomNavBar(),
    );
  }
}

class RideBottomNavBar extends StatefulWidget {
  const RideBottomNavBar({
    super.key,
  });

  @override
  State<RideBottomNavBar> createState() => _RideBottomNavBarState();
}

class _RideBottomNavBarState extends State<RideBottomNavBar> {
  late int currentPage;

  @override
  Widget build(BuildContext context) {
    currentPage = 1;

    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          FlatIconButton(
            onPressed: () {
              currentPage = 1;
            },
            label: const Text('1'),
            icon: const Icon(Icons.map_outlined),
          ),
          FlatIconButton(
            onPressed: () {
              currentPage = 2;
            },
            label: const Text('2'),
            icon: const Icon(Icons.list_alt),
          ),
          FlatIconButton(
              onPressed: () {
                currentPage = 3;
              },
              label: const Text('3'),
              icon: const Icon(Icons.check_sharp))
        ].map((widget) => Expanded(child: widget)).toList(),
      ),
    );
  }
}
