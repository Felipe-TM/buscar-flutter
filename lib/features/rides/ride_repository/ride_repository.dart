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
  var rides = <RideDetailsModel>{};

  @override
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel) async {
    var vrides = <RideDetailsModel>{};

    RideDetailsModel ride = RideDetailsModel(rideId: 'teste');
    ride.setDestinationCoord = LatLng(-23.31626977268213, -51.17078443721138);
    ride.setDestination =
        'Av. Juscelino Kubitscheck - Quebec, Londrina - PR, 86020-000';
    ride.setOriginCoord = LatLng(-23.28761451997945, -51.12200008649667);
    ride.setOrigin =
        'R. Orlando Silva, 800-964 - Santa Izabel, Londrina - PR, 86031-010';
    ride.setDrivername = 'Felipe Torres Maciel';
    ride.setArrivalTime = '10:00';
    ride.setDepartureTime = '9:50';
    ride.setDate = '23/06/2024';
    ride.setNumberOfPassangers = 2;
    ride.setCarManufacturer = 'BMW';
    ride.setCarModel = '325i';
    ride.setCarPlate = 'DAI9625';
    ride.setStatus = 'Em espera';

    vrides.add(ride);

    return Future.delayed(const Duration(seconds: 2)).then((value) => vrides);
  }

  @override
  Future<Set<RideDetailsModel>> getMyAppointments() async {
    var vrides = <RideDetailsModel>{};

    RideDetailsModel ride = RideDetailsModel(rideId: 'teste');
    ride.setDestinationCoord = LatLng(-23.31626977268213, -51.17078443721138);
    ride.setDestination =
        'Av. Juscelino Kubitscheck - Quebec, Londrina - PR, 86020-000';
    ride.setOriginCoord = LatLng(-23.28761451997945, -51.12200008649667);
    ride.setOrigin =
        'R. Orlando Silva, 800-964 - Santa Izabel, Londrina - PR, 86031-010';
    ride.setDrivername = 'Felipe Torres Maciel';
    ride.setArrivalTime = '10:00';
    ride.setDepartureTime = '9:50';
    ride.setDate = '23/06/2024';
    ride.setNumberOfPassangers = 2;
    ride.setCarManufacturer = 'BMW';
    ride.setCarModel = '325i';
    ride.setCarPlate = 'DAI9625';
    ride.setStatus = 'Em espera';

    vrides.add(ride);

    return Future.delayed(const Duration(seconds: 2)).then((value) => vrides);
  }

  @override
  Future<RideDetailsModel> getRideDetails(String rideId) async {
    // TODO: implement getRideDetails
    throw UnimplementedError();
  }

  @override
  void publishRide(RideDetailsModel detailsModel) async {
    var vrides = <RideDetailsModel>{};

    RideDetailsModel ride = RideDetailsModel(rideId: 'teste');
    ride.setDestinationCoord = LatLng(-23.31626977268213, -51.17078443721138);
    ride.setDestination =
        'Av. Juscelino Kubitscheck - Quebec, Londrina - PR, 86020-000';
    ride.setOriginCoord = LatLng(-23.28761451997945, -51.12200008649667);
    ride.setOrigin =
        'R. Orlando Silva, 800-964 - Santa Izabel, Londrina - PR, 86031-010';
    ride.setDrivername = 'Felipe Torres Maciel';
    ride.setArrivalTime = '10:00';
    ride.setDepartureTime = '9:50';
    ride.setDate = '23/06/2024';
    ride.setNumberOfPassangers = 2;
    ride.setCarManufacturer = 'BMW';
    ride.setCarModel = '325i';
    ride.setCarPlate = 'DAI9625';
    ride.setStatus = 'Em espera';

    vrides.add(ride);

    return Future.delayed(const Duration(seconds: 2)).then((value) => vrides);
  }
}
