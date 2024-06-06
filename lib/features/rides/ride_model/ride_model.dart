import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideModel extends ChangeNotifier {
  late String origin = '';
  late String destination = '';
  late LatLng originCoord;
  late LatLng destinationCoord;
  late DateTime date;
  late TimeOfDay departureTime;
  late TimeOfDay arrivalTime;
  late TimeOfDay timeWindow;
  late int numberOfPassangers = 0;

  TimeOfDay get getTimeWindow => timeWindow;

  set setTimeWindow(TimeOfDay timeWindow) {
    this.timeWindow = timeWindow;
    notifyListeners();
  }

  late double searchRadius;

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

  set setDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  get getDepartureTime => departureTime;

  set setDepartureTime(TimeOfDay departureTime) {
    this.departureTime = departureTime;
    notifyListeners();
  }

  get getArrivalTime => arrivalTime;

  set setArrivalTime(TimeOfDay arrivalTime) {
    this.arrivalTime = arrivalTime;
    notifyListeners();
  }

  get getSearchRadius => searchRadius;

  set setSearchRadius(double searchRadius) {
    this.searchRadius = searchRadius;
    notifyListeners();
  }

  get getNumberOfPassangers => numberOfPassangers;

  set setNumberOfPassangers(int numberOfPassangers) {
    this.numberOfPassangers = numberOfPassangers;
    notifyListeners();
  }
}
