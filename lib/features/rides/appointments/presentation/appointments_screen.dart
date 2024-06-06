import 'package:buscar/common_widgets/loading_widget.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_details/presentation/ride_details_screen.dart';
import 'package:buscar/features/rides/ride_repository/ride_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appointment_tile.dart';
import 'appointments_filters.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with TickerProviderStateMixin {
  late Set<RideDetailsModel> rides;
  late AnimationController controller;
  bool isLoading = true;

  @override
  void initState() {
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

  void getMyAppointments() async {
    rides = await Provider.of<RideRepository>(context).getMyAppointments();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    getMyAppointments();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Builder(builder: (context) {
        while (isLoading) {
          return LoadingWidget(controller: controller);
        }
        return Stack(
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
                            numberOfPassengers:
                                ride.getNumberOfPassangers.toString(),
                            departureTime: ride.getDepartureTime,
                            status: ride.getStatus,
                            date: ride.getDate,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChangeNotifierProvider<RideDetailsModel>(
                                    create: (BuildContext context) {
                                      return ride;
                                    },
                                    child: RideDetailsScreen(),
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
        );
      }),
    );
  }
}
