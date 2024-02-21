import 'dart:async';

import 'package:buscar/common_widgets/flat_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      bottomNavigationBar: RideBottomNavBar(),
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

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late String _darkMapStyle =
      rootBundle.loadString('assets\json\map_dark_theme.json').toString();
  late String _lightMapStyle =
      rootBundle.loadString('assets\json\map_dark_theme.json').toString();
  late String _currentMapStyle;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialPos = CameraPosition(
      target: LatLng(-23.316321971739562, -51.17272870369577),
      zoom: 15.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    (Theme.of(context).brightness == Brightness.dark)
        ? _currentMapStyle = _darkMapStyle
        : _currentMapStyle = _lightMapStyle;

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialPos,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(_currentMapStyle);
        _controller.complete(controller);
      },
    );
  }
}
