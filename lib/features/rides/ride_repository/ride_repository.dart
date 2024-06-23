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
  var rides = <RideDetailsModel>{};

  @override
  Future<Set<RideDetailsModel>> findRides(RideModel rideModel) async {
    var rides = <RideDetailsModel>{};

    var test1 = RideDetailsModel(rideId: 'teste');
    test1.setDrivername = 'Felipe Torres';
    test1.setDestination = 'Teste1';
    test1.setOriginCoord =
        const LatLng(-23.287424694342764, -51.122979786611964);
    test1.setDestinationCoord =
        const LatLng(-23.420732724864173, -51.94692811208516);
    test1.setOrigin = 'Rua Orlando Silva';
    test1.setArrivalTime = TimeOfDay.now().toString();
    test1.setDepartureTime = TimeOfDay.now().toString();

    var test2 = RideDetailsModel(rideId: 'teste2');
    test2.setDrivername = 'Wilson Maciel';
    test2.setOrigin = 'Teste';
    test2.setDestination = 'Rua Orlando Silva';
    test2.setOriginCoord =
        const LatLng(-23.286527628405555, -51.12419848357015);
    test2.setDestinationCoord =
        const LatLng(-23.284968591623986, -51.17193918237298);
    test2.setArrivalTime = TimeOfDay.now().to24hours();
    test2.setDepartureTime = TimeOfDay.now().to24hours();
    test2.setDate = DateFormat('dd/MM/yyyy').format(rideModel.date);
    test2.setStatus = 'Em espera';

    rides.add(test1);
    rides.add(test2);

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
