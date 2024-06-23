import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:buscar/features/account/account_details/model/account_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class RideDetailsModel extends ChangeNotifier {
  final String? rideId;
  late String driverId;
  late String origin = '';
  late String destination = '';
  late LatLng originCoord;
  late LatLng destinationCoord;
  late String date = '';
  late String departureTime = '';
  late String arrivalTime = '';
  late String status = 'Em espera';
  late int numberOfPassangers = 0;
  late String driverName = '';
  late String carModel = '';
  late String carPlate = '';
  late String carManufacturer = '';

  RideDetailsModel({
    this.rideId,
  });

  int get getNumberOfPassangers => numberOfPassangers;

  set setNumberOfPassangers(int value) {
    numberOfPassangers = value;
  }

  String get getStatus => status;

  set setStatus(String value) {
    status = value;
  }

  get getOrigin => origin;

  set setOrigin(String origin) {
    this.origin = origin;
    notifyListeners();
  }

  get getDestination => destination;

  set setDestination(String destination) {
    this.destination = destination;
    notifyListeners();
  }

  get getOriginCoord => originCoord;

  set setOriginCoord(LatLng originCoord) {
    this.originCoord = originCoord;
    notifyListeners();
  }

  get getDestinationCoord => destinationCoord;

  set setDestinationCoord(LatLng destinationCoord) {
    this.destinationCoord = destinationCoord;
    notifyListeners();
  }

  get getDate => date;

  set setDate(String date) {
    this.date = date;
    notifyListeners();
  }

  get getDepartureTime => departureTime;

  set setDepartureTime(String departureTime) {
    this.departureTime = departureTime;
    notifyListeners();
  }

  get getArrivalTime => arrivalTime;

  set setArrivalTime(String arrivalTime) {
    this.arrivalTime = arrivalTime;
    notifyListeners();
  }

  get getDriverName => driverName;

  set setDrivername(String driverName) {
    this.driverName = driverName;
    notifyListeners();
  }

  get getCarModel => carModel;

  set setCarModel(String carModel) {
    this.carModel = carModel;
    notifyListeners();
  }

  get getCarPlate => carPlate;

  set setCarPlate(String carPlate) {
    this.carPlate = carPlate;
    notifyListeners();
  }

  get getCarManufacturer => carManufacturer;

  set setCarManufacturer(String carManufacturer) {
    this.carManufacturer = carManufacturer;
    notifyListeners();
  }

  get getDriverId => driverId;

  set setDriverId(String driverId) {
    this.driverId = driverId;
    notifyListeners();
  }

  void cloneFromModel({required RideModel rideModel, AccountModel? account}) {
    setOrigin = rideModel.origin;
    setDestination = rideModel.destination;
    setOriginCoord = rideModel.originCoord;
    setDestinationCoord = rideModel.destinationCoord;
    setDepartureTime = rideModel.departureTime.to24hours();
    setArrivalTime = rideModel.arrivalTime.to24hours();
    setDate = DateFormat('dd/MM/yyyy').format(rideModel.date);
    setNumberOfPassangers = rideModel.numberOfPassangers;

    if (account != null) {
      setDriverId = account.accountId;
      setDrivername = account.getFullLegalName;
      setCarManufacturer = account.getCarManufacturer;
      setCarModel = account.getCarModel;
      setCarPlate = account.getCarPlate;
    }
  }
}
