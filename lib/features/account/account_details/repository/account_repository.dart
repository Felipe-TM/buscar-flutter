import 'package:buscar/features/account/account_details/model/account_model.dart';

abstract class AccountRepository {
  Future<AccountModel> getAccountDetails(String id);
  void updateAccountDetails(AccountModel accountModel);
}

class FakeRepo implements AccountRepository {
  @override
  Future<AccountModel> getAccountDetails(String id) async {
    var account = AccountModel();
    account.setUserName = 'Felipe Torres';
    account.setUserRating = '4.5';
    account.setEmail = 'felipemaciel@exemplo.com';
    account.setFullLegalName = 'Felipe Torres Maciel';
    account.setPhoneNumber = '+55 43 99912345678';
    account.setCarModel = '325i';
    account.setCarColor = 'Preto';
    account.setCarPlate = 'DAI9625';
    account.setCarManufacturer = 'BMW';
    account.setCarModelYear = 2011;

    return account;
  }

  @override
  void updateAccountDetails(AccountModel accountModel) {
    // TODO: implement updateAccountDetails
  }
}
