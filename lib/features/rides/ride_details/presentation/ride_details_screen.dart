import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/common_widgets/widget_to_map_icon.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'ride_details_sheet.dart';

class RideDetailsScreen extends StatefulWidget {
  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  late RideDetailsModel model;
  late Set<Marker> markers;

  @override
  void initState() {
    markers = <Marker>{};

    super.initState();
  }

  @override
  void didChangeDependencies() {
    model = Provider.of<RideDetailsModel>(context);
    super.didChangeDependencies();
  }

  void addMarkers() async {
    markers.add(
      Marker(
        markerId: const MarkerId('origin'),
        position: model.originCoord,
        infoWindow: const InfoWindow(title: 'Origem'),
        icon: await const Icon(
          Icons.place,
          color: Colors.red,
          size: 45,
        ).toBitmapDescriptor(),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: model.destinationCoord,
        infoWindow: const InfoWindow(title: 'Destino'),
        icon: await const Icon(
          Icons.place_outlined,
          color: Colors.red,
          size: 45,
        ).toBitmapDescriptor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    addMarkers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Corrida'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(children: [
        GoogleMapWidget(
          markers: markers,
          cameraPosition: CameraPosition(
              target: model.getOriginCoord,
              zoom: 16.151926040649414,
              tilt: 0.0),
        ),
        RideDetailsSheet(),
      ]),
    );
  }
}
