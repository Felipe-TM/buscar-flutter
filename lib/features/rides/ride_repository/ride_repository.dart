import 'dart:async';

import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

abstract class RideRepository extends ChangeNotifier {
  Future<RideDetailsModel> getRideDetails(String rideId);
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel);
  Future<Set<RideDetailsModel>> getMyAppointments();
  void publishRide(RideDetailsModel detailsModel);
}

class FakeRideRepo extends ChangeNotifier implements RideRepository {
  @override
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel) async {
    var rides = <RideDetailsModel>{};

    var test1 = RideDetailsModel(rideId: 'teste');
    test1.setDrivername = 'Felipe Torres';
    test1.setDestination = 'Teste1';
    test1.setOriginCoord =
        const LatLng(-23.286606467246642, -51.122567700512796);
    test1.setDestinationCoord =
        const LatLng(-23.284968591623986, -51.17193918237298);
    test1.setOrigin = 'Rua Orlando Silva';
    test1.setArrivalTime = TimeOfDay.now().toString();
    test1.setDepartureTime = TimeOfDay.now().toString();

    var test2 = RideDetailsModel(rideId: 'teste2');
    test2.setDrivername = 'Wilson Maciel';
    test2.setDestination = 'Teste2';
    test2.setOriginCoord =
        const LatLng(-23.286527628405555, -51.12419848357015);
    test2.setDestinationCoord =
        const LatLng(-23.284968591623986, -51.17193918237298);
    test2.setArrivalTime = TimeOfDay.now().to24hours();
    test2.setDepartureTime = TimeOfDay.now().to24hours();
    test2.setDate = DateFormat('dd/MM/yyyy').format(rideModel.date);

    rides.add(test1);
    rides.add(test2);

    return Future.delayed(const Duration(seconds: 2)).then((value) => rides);
  }

  @override
  Future<Set<RideDetailsModel>> getMyAppointments() async {
    var rides = <RideDetailsModel>{};
    var test1 = RideDetailsModel(rideId: 'teste');
    test1.setDestination = 'Teste1';
    test1.setOriginCoord =
        const LatLng(-23.260702010373702, -51.138017066854104);
    test1.setDestinationCoord =
        const LatLng(-23.284968591623986, -51.17193918237298);
    test1.setOrigin = 'Rua Orlando Silva';
    var test2 = RideDetailsModel(rideId: 'teste2');
    test2.setDestination = 'Teste2';
    test2.setOriginCoord =
        const LatLng(-23.260702010373702, -51.138017066854104);
    test2.setDestinationCoord =
        const LatLng(-23.284968591623986, -51.17193918237298);
    rides.add(test1);
    rides.add(test2);
    return Future.delayed(const Duration(seconds: 1)).then((value) => rides);
  }

  @override
  Future<RideDetailsModel> getRideDetails(String rideId) async {
    // TODO: implement getRideDetails
    throw UnimplementedError();
  }

  @override
  void publishRide(RideDetailsModel detailsModel) async {
    // TODO: implement publishRide
  }
}
