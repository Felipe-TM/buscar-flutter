import 'dart:async';

import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';

abstract class RideRepository extends ChangeNotifier {
  Future<RideDetailsModel> getRideDetails(String rideId);
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel);
  Future<Set<RideDetailsModel>> getMyAppointments();
  void publishRide(RideDetailsModel detailsModel);
}

class FakeRideRepo extends ChangeNotifier implements RideRepository {
  var rides = <RideDetailsModel>{};

  @override
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel) async {
    var rides = <RideDetailsModel>{};

    return Future.delayed(const Duration(seconds: 2)).then((value) => rides);
  }

  @override
  Future<Set<RideDetailsModel>> getMyAppointments() async {
    return Future.delayed(const Duration(seconds: 1)).then((value) => rides);
  }

  @override
  Future<RideDetailsModel> getRideDetails(String rideId) async {
    // TODO: implement getRideDetails
    throw UnimplementedError();
  }

  @override
  void publishRide(RideDetailsModel detailsModel) async {
    rides.add(detailsModel);
    notifyListeners();
  }
}
