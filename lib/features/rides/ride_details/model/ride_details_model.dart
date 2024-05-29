import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideDetailsModel extends ChangeNotifier {
  late String rideId;
  late String origin = '';
  late String destination = '';
  late LatLng originCoord;
  late LatLng destinationCoord;
  late String date = '';
  late String departureTime = '';
  late String arrivalTime = '';
  late String status = '';
  late String numberOfPassangers = '';
  late String driverName = '';
  late String carModel = '';
  late String carPlate = '';
  late String carManufacturer = '';

  RideDetailsModel({
    required this.rideId,
  });

  String get getNumberOfPassangers => numberOfPassangers;

  set setNumberOfPassangers(String value) {
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
}
