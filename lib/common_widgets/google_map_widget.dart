import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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
