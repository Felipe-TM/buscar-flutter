import 'package:buscar/common_widgets/underline_text_field.dart';
import 'package:buscar/features/account/account_details/model/account_model.dart';
import 'package:buscar/features/account/account_details/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/loading_widget.dart';
import 'account_details.dart';
import 'account_hero.dart';
import 'vehicle_details.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  late AccountModel accountModel;
  late AnimationController controller;
  late bool isLoading = true;

  TextEditingController carManufacturer = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carPlate = TextEditingController();
  TextEditingController carColor = TextEditingController();

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getAccount();
    super.didChangeDependencies();
  }

  void getAccount() async {
    accountModel = Provider.of<AccountRepository>(context).getAccountDetails();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Builder(builder: (context) {
        while (isLoading) {
          return LoadingWidget(controller: controller);
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Consumer<AccountRepository>(
              builder: (BuildContext context, AccountRepository repository,
                  Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountHero(
                      userRating: accountModel.getUserRating,
                      userName: accountModel.getUserName,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 25),
                      child: AccountDetails(
                          fullLegalName: accountModel.getFullLegalName,
                          email: accountModel.getEmail,
                          phoneNumber: accountModel.getPhoneNumber),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: OutlinedButton.icon(
                            onPressed: () {
                              _changeUserDetails(context);
                              repository.updateAccountDetails(accountModel);
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text('Editar')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: VehicleDetails(
                        manufacturer: accountModel.getCarManufacturer,
                        model: accountModel.getCarModel,
                        modelYear: accountModel.getCarModelYear,
                        plate: accountModel.getCarPlate,
                        color: accountModel.carColor!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: OutlinedButton.icon(
                            onPressed: () {
                              _changeVehicleDetails(context);
                              repository.updateAccountDetails(accountModel);
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text('Editar')),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Future<void> _changeVehicleDetails(BuildContext context) {
    AccountModel account = accountModel;
    carModel.value = TextEditingValue(text: account.getCarModel);
    carManufacturer.value = TextEditingValue(text: account.getCarManufacturer);
    carYear.value = TextEditingValue(text: account.getCarModelYear.toString());
    carPlate.value = TextEditingValue(text: account.getCarPlate);
    carColor.value = TextEditingValue(text: account.getCarColor);

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Alterar dados do Veiculo'),
          content: SingleChildScrollView(
            child: Column(children: [
              UnderlineTextField(
                label: 'Fabricante',
                controller: carManufacturer,
              ),
              UnderlineTextField(
                label: 'Modelo',
                controller: carModel,
              ),
              UnderlineTextField(
                label: 'Ano',
                controller: carYear,
                keyboardType: TextInputType.number,
              ),
              UnderlineTextField(
                label: 'Placa',
                controller: carPlate,
              ),
              UnderlineTextField(
                label: 'Cor',
                controller: carColor,
              ),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Salvar'),
              onPressed: () {
                account.setCarManufacturer = carManufacturer.value.text;
                account.setCarModel = carModel.value.text;
                account.setCarModelYear = int.parse(carYear.value.text);
                account.setCarPlate = carPlate.value.text;
                account.setCarColor = carColor.value.text;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _changeUserDetails(BuildContext context) {
    AccountModel account = accountModel;

    email.value = TextEditingValue(text: account.getEmail);
    fullName.value = TextEditingValue(text: account.getFullLegalName);
    phoneNumber.value = TextEditingValue(text: account.getPhoneNumber);

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Alterar dados do Veiculo'),
          content: SingleChildScrollView(
            child: Column(children: [
              UnderlineTextField(
                label: 'Nome Completo',
                controller: fullName,
              ),
              UnderlineTextField(
                label: 'Email',
                controller: email,
              ),
              UnderlineTextField(
                label: 'Telefone',
                controller: phoneNumber,
                keyboardType: TextInputType.number,
              ),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Salvar'),
              onPressed: () {
                setState(() {
                  account.setEmail = email.value.text;
                  account.setPhoneNumber = phoneNumber.value.text;
                  account.setFullLegalName = fullName.value.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
