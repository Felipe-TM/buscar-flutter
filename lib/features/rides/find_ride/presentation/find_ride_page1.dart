import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:buscar/common_widgets/widget_to_map_icon.dart';
import 'package:buscar/features/rides/find_ride/model/find_ride_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FindRidePage1 extends StatefulWidget {
  const FindRidePage1({
    super.key,
  });

  @override
  State<FindRidePage1> createState() => _FindRidePage1State();
}

class _FindRidePage1State extends State<FindRidePage1> {
  late Set<Marker> _markers;
  late TextEditingController _originController;
  late TextEditingController _destinationController;
  late FocusNode _originFocusNode;
  late FocusNode _destinationFocusNode;
  late LatLng originCoord;
  late LatLng destinationCoord;

  @override
  void initState() {
    _originFocusNode = FocusNode();
    _originController = TextEditingController();
    _destinationController = TextEditingController();
    _destinationFocusNode = FocusNode();
    _markers = <Marker>{};
    super.initState();
  }

  @override
  void dispose() {
    _originFocusNode.dispose();
    _destinationFocusNode.dispose();
    _destinationController.dispose();
    _originController.dispose();
    super.dispose();
  }

  void addMarker(LatLng coord) async {
    if (_originFocusNode.hasFocus) {
      _markers.add(
        Marker(
          markerId: const MarkerId('origin'),
          position: coord,
          infoWindow: const InfoWindow(title: 'Origem'),
          icon: await const Icon(
            Icons.place,
            color: Colors.blue,
            size: 45,
          ).toBitmapDescriptor(),
          onTap: () {
            _originFocusNode.requestFocus();
          },
        ),
      );
      originCoord = coord;
      await placemarkFromCoordinates(coord.latitude, coord.longitude).then(
        (List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          _originController.value = TextEditingValue(
              text:
                  '${place.street}, ${place.subAdministrativeArea}, ${place.postalCode}');
        },
      );
    }
    if (_destinationFocusNode.hasFocus) {
      _markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: coord,
          infoWindow: const InfoWindow(title: 'Destino'),
          icon: await const Icon(
            Icons.place_outlined,
            color: Colors.blue,
            size: 45,
          ).toBitmapDescriptor(),
          onTap: () {
            _destinationFocusNode.requestFocus();
          },
        ),
      );
      destinationCoord = coord;
      await placemarkFromCoordinates(coord.latitude, coord.longitude).then(
        (List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          _destinationController.value = TextEditingValue(
              text:
                  '${place.street}, ${place.subAdministrativeArea}, ${place.postalCode}');
        },
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMapWidget(
          markers: _markers,
          onTap: (coord) {
            addMarker(coord);
          },
        ),
        LocationInputBox(
          originController: _originController,
          destinationController: _destinationController,
          originFocusNode: _originFocusNode,
          destinationFocusNode: _destinationFocusNode,
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: SizedBox(
            width: 120,
            child: NavigationButton(
                onTap: () {
                  try {
                    Provider.of<FindRideModel>(context, listen: false)
                        .setOrigin = _originController.value.text;
                    Provider.of<FindRideModel>(context, listen: false)
                        .setDestination = _destinationController.value.text;
                    Provider.of<FindRideModel>(context, listen: false)
                        .setOriginCoord = originCoord;
                    Provider.of<FindRideModel>(context, listen: false)
                        .setDestinationCoord = destinationCoord;
                    DefaultTabController.of(context).animateTo(1);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      duration: const Duration(seconds: 8),
                      content: Text(
                        'Adicione os pontos de partida e destino antes de continuar...',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onError),
                      ),
                    ));
                  }
                },
                content: const Row(
                  children: [Text('Proximo'), Icon(Icons.arrow_forward)],
                )),
          ),
        )
      ],
    );
  }
}
