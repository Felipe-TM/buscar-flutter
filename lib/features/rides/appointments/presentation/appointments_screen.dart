import 'package:buscar/features/rides/ride_details/model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_details/presentation/ride_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'appointment_tile.dart';
import 'appointments_filters.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late Set<RideDetailsModel> rides;

  @override
  void initState() {
    rides = <RideDetailsModel>{};
    var test1 = RideDetailsModel(rideId: 'teste');
    test1.setDestination = 'Teste1';
    test1.setOriginCoord = LatLng(-23.260702010373702, -51.138017066854104);
    test1.destinationCoord = LatLng(-23.284968591623986, -51.17193918237298);
    var test2 = RideDetailsModel(rideId: 'teste2');
    test2.setDestination = 'Teste2';
    test2.setOriginCoord = LatLng(-23.260702010373702, -51.138017066854104);
    test2.destinationCoord = LatLng(-23.284968591623986, -51.17193918237298);

    rides.add(test1);
    rides.add(test2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Column(
                  children: rides
                      .map(
                        (ride) => AppointmentTile(
                          destination: ride.getDestination,
                          numberOfPassengers: ride.getNumberOfPassangers,
                          departureTime: ride.getDepartureTime,
                          status: ride.getStatus,
                          date: ride.getDate,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RideDetailsScreen(
                                  ride: ride,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          const ListFilters(),
        ],
      ),
    );
  }
}
