import 'package:flutter/material.dart';

class AccountModel extends ChangeNotifier {
  final String accountId;

  late String? fullLegalName = '';
  late String? email = '';
  late String? phoneNumber = '';
  late String? userRating = '';
  late String? userName = '';
  late String? carManufacturer = '';
  late String? carModel = '';
  late int? carModelYear = 0;
  late String? carColor = '';
  late String? carPlate = '';

  AccountModel({
    required this.accountId,
    this.fullLegalName,
    this.email,
    this.phoneNumber,
    this.userRating,
    this.userName,
    this.carManufacturer,
    this.carModel,
    this.carModelYear,
    this.carColor,
    this.carPlate,
  });

  get getFullLegalName => fullLegalName;

  set setFullLegalName(String fullLegalName) {
    this.fullLegalName = fullLegalName;
    notifyListeners();
  }

  get getEmail => email;

  set setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  get getPhoneNumber => phoneNumber;

  set setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }

  get getUserRating => userRating;

  set setUserRating(String userRating) {
    this.userRating = userRating;
    notifyListeners();
  }

  get getUserName => userName;

  set setUserName(String userName) {
    this.userName = userName;
    notifyListeners();
  }

  get getCarManufacturer => carManufacturer;

  set setCarManufacturer(String carManufacturer) {
    this.carManufacturer = carManufacturer;
    notifyListeners();
  }

  get getCarModel => carModel;

  set setCarModel(String carModel) {
    this.carModel = carModel;
    notifyListeners();
  }

  get getCarModelYear => carModelYear;

  set setCarModelYear(int carModelYear) {
    this.carModelYear = carModelYear;
    notifyListeners();
  }

  get getCarColor => carColor;

  set setCarColor(String carColor) {
    this.carColor = carColor;
    notifyListeners();
  }

  get getCarPlate => carPlate;

  set setCarPlate(String carPlate) {
    this.carPlate = carPlate;
    notifyListeners();
  }
}
