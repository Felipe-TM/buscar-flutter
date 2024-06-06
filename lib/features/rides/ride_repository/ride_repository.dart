import 'dart:async';

import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class RideRepository extends ChangeNotifier {
  Future<RideDetailsModel> getRideDetails(String rideId);
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel);
  Future<Set<RideDetailsModel>> getMyAppointments();
  void publishRide(RideDetailsModel detailsModel);
}

class FakeRideRepo extends ChangeNotifier implements RideRepository {
  @override
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel) async {
    // TODO: implement findRides
    throw UnimplementedError();
  }

  @override
  Future<Set<RideDetailsModel>> getMyAppointments() async {
    var rides = <RideDetailsModel>{};
    var test1 = RideDetailsModel(rideId: 'teste');
    test1.setDestination = 'Teste1';
    test1.setOriginCoord = LatLng(-23.260702010373702, -51.138017066854104);
    test1.setDestinationCoord = LatLng(-23.284968591623986, -51.17193918237298);
    test1.setOrigin = 'Rua Orlando Silva';
    var test2 = RideDetailsModel(rideId: 'teste2');
    test2.setDestination = 'Teste2';
    test2.setOriginCoord = LatLng(-23.260702010373702, -51.138017066854104);
    test2.setDestinationCoord = LatLng(-23.284968591623986, -51.17193918237298);
    rides.add(test1);
    rides.add(test2);
    return Future.delayed(Duration(seconds: 1)).then((value) => rides);
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
