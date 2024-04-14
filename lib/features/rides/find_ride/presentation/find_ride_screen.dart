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
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LocationInputWidget(
                    icon: Icons.home,
                    hint: 'De onde?',
                  ),
                  const LocationInputWidget(
                    hint: 'Para onde?',
                  ),
                ]
                    .map((widget) => Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: widget,
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: RideBottomNavBar(),
    );
  }
}

class LocationInputWidget extends StatelessWidget {
  final IconData icon;
  final String hint;

  const LocationInputWidget(
      {super.key, this.icon = Icons.location_on_outlined, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        border: const OutlineInputBorder(
          gapPadding: 5,
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
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
  String? _darkMapStyle;
  String? _lightMapStyle;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialPos = CameraPosition(
      target: LatLng(-23.316321971739562, -51.17272870369577),
      zoom: 15.151926040649414);

  @override
  void initState() {
    _loadDarkStyle();
    _loadLightStyle();
    super.initState();
  }

  Future _loadDarkStyle() async {
    _darkMapStyle = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/json/map_dark_theme.json');
  }

  Future _loadLightStyle() async {
    _lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/json/map_light_theme.json');
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialPos,
      onMapCreated: (GoogleMapController controller) {
        (Theme.of(context).brightness == Brightness.dark)
            ? controller.setMapStyle(_darkMapStyle)
            : controller.setMapStyle(_lightMapStyle);
        _controller.complete(controller);
      },
    );
  }
}
