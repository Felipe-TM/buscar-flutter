import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/common_widgets/widget_to_map_icon.dart';
import 'package:buscar/features/rides/ride_details/model/ride_details_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ride_details_sheet.dart';

class RideDetailsScreen extends StatefulWidget {
  final RideDetailsModel ride;

  const RideDetailsScreen({super.key, required this.ride});

  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  late Set<Marker> markers;

  @override
  void initState() {
    markers = <Marker>{};
    addMarkers();
    super.initState();
  }

  void addMarkers() async {
    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: widget.ride.getDestinationCoord,
        infoWindow: const InfoWindow(title: 'Destino'),
        icon: await const Icon(
          Icons.place_outlined,
          color: Colors.red,
          size: 45,
        ).toBitmapDescriptor(),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('origin'),
        position: widget.ride.getOriginCoord,
        infoWindow: const InfoWindow(title: 'Origem'),
        icon: await const Icon(
          Icons.place,
          color: Colors.red,
          size: 45,
        ).toBitmapDescriptor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Corrida'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(children: [
        GoogleMapWidget(
          markers: markers,
        ),
        RideDetailsSheet(
          origin: widget.ride.getOrigin,
          destination: widget.ride.getDestination,
          departureTime: widget.ride.getDepartureTime,
          arrivalTime: widget.ride.getArrivalTime,
          rideStatus: widget.ride.getStatus,
          driverName: 'Bruno',
          carModel: 'Fox',
          carManufacturer: 'VW',
          carPlate: '8HK26S',
        ),
      ]),
    );
  }
}
