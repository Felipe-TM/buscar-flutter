import 'package:buscar/features/account/account_details/model/account_model.dart';
import 'package:flutter/material.dart';

abstract class AccountRepository extends ChangeNotifier {
  late final AccountModel? account;

  AccountModel getAccountDetails();
  void fetchAccountDetails(String id);
  void updateAccountDetails(AccountModel accountModel);
}

class FakeAccRepo extends ChangeNotifier implements AccountRepository {
  @override
  AccountModel? account;

  @override
  AccountModel getAccountDetails() {
    if (account == null) fetchAccountDetails('id');
    return account!;
  }

  @override
  void updateAccountDetails(AccountModel accountModel) async {
    account = accountModel;
    notifyListeners();
  }

  @override
  void fetchAccountDetails(String id) {
    account = AccountModel(
      accountId: 'Teste',
      userName: 'Thiago Mourão',
      userRating: '4.5',
      email: 'felipemaciel@exemplo.com',
      fullLegalName: 'Felipe Torres Maciel',
      phoneNumber: '+55 43 99912345678',
      carManufacturer: 'BMW',
      carModel: '325i',
      carColor: 'Preto',
      carModelYear: 2011,
      carPlate: 'DAI9625',
    );
  }
}
