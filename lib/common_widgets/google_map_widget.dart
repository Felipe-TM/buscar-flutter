import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';

import 'loading_widget.dart';

class GoogleMapWidget extends StatefulWidget {
  final Set<Marker> markers;
  final Function(LatLng)? onTap;
  final CameraPosition? cameraPosition;

  const GoogleMapWidget(
      {super.key, required this.markers, this.onTap, this.cameraPosition});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget>
    with TickerProviderStateMixin {
  String? _darkMapStyle;
  String? _lightMapStyle;
  CameraPosition? userCurrentPos;
  bool serviceEnabled = false;
  LocationPermission permission = LocationPermission.denied;
  late Set<Marker> markers = widget.markers;
  bool isLoading = true;
  late AnimationController controller;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // ignore: constant_identifier_names
  static const CameraPosition DEFAULT_INITIAL_POS = CameraPosition(
      target: LatLng(-23.318564475140054, -51.16910912796359),
      zoom: 14.151926040649414,
      tilt: 0.0);

  @override
  void initState() {
    _determinePosition();
    _loadDarkStyle();
    _loadLightStyle();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future _loadDarkStyle() async {
    String darkMapStyle = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/json/map_dark_theme.json');
    setState(() {
      _darkMapStyle = darkMapStyle;
    });
  }

  Future _loadLightStyle() async {
    String lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/json/map_light_theme.json');
    setState(() {
      _lightMapStyle = lightMapStyle;
    });
  }

  Future _determinePosition() async {
    Position currentPosition;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPos = CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 16.151926040649414,
        tilt: 0.0);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    while (isLoading) {
      return LoadingWidget(
        controller: controller,
        label: const Text('Carregando o Mapa...'),
      );
    }

    if (widget.cameraPosition != null) {
      return GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
        onTap: (coord) {
          widget.onTap!(coord);
        },
        initialCameraPosition: widget.cameraPosition!,
        onMapCreated: (GoogleMapController controller) {
          (Theme.of(context).brightness == Brightness.dark)
              ? controller.setMapStyle(_darkMapStyle)
              : controller.setMapStyle(_lightMapStyle);
          _controller.complete(controller);
        },
      );
    }

    return (userCurrentPos != null)
        ? GoogleMap(
            markers: markers,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            onTap: (coord) {
              widget.onTap!(coord);
            },
            initialCameraPosition: userCurrentPos!,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                (Theme.of(context).brightness == Brightness.dark)
                    ? controller.setMapStyle(_darkMapStyle)
                    : controller.setMapStyle(_lightMapStyle);
                _controller.complete(controller);
              });
            },
          )
        : GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            initialCameraPosition: DEFAULT_INITIAL_POS,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                (Theme.of(context).brightness == Brightness.dark)
                    ? controller.setMapStyle(_darkMapStyle)
                    : controller.setMapStyle(_lightMapStyle);
                _controller.complete(controller);
              });
            },
          );
  }
}
