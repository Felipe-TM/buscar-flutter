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
  late AccountRepository repository;

  @override
  void initState() {
    repository = FakeRepo();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    getAccount();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getAccount() async {
    accountModel = await repository.getAccountDetails('');
    isLoading = false;
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
            child: ChangeNotifierProvider<AccountModel>(
              create: (BuildContext context) {
                return accountModel;
              },
              child: Builder(builder: (context) {
                return Consumer<AccountModel>(
                  builder: (BuildContext context, AccountModel model,
                      Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountHero(
                          userRating: model.getUserRating,
                          userName: model.getUserName,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 25),
                          child: AccountDetails(
                              fullLegalName: model.getFullLegalName,
                              email: model.getEmail,
                              phoneNumber: model.getPhoneNumber),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: OutlinedButton.icon(
                                onPressed: () => _changeUserDetails(context),
                                icon: const Icon(Icons.edit),
                                label: const Text('Editar')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: VehicleDetails(
                            manufacturer: model.getCarManufacturer,
                            model: model.getCarModel,
                            modelYear: model.getCarModelYear,
                            plate: model.getCarPlate,
                            color: model.carColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: OutlinedButton.icon(
                                onPressed: () => _changeVehicleDetails(context),
                                icon: const Icon(Icons.edit),
                                label: const Text('Editar')),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}

Future<void> _changeVehicleDetails(BuildContext context) {
  AccountModel account = Provider.of<AccountModel>(context, listen: false);
  TextEditingController manufacturer = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController plate = TextEditingController();
  TextEditingController color = TextEditingController();

  model.value = TextEditingValue(text: account.getCarModel);
  manufacturer.value = TextEditingValue(text: account.getCarManufacturer);
  year.value = TextEditingValue(text: account.getCarModelYear.toString());
  plate.value = TextEditingValue(text: account.getCarPlate);
  color.value = TextEditingValue(text: account.getCarColor);

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
              controller: manufacturer,
            ),
            UnderlineTextField(
              label: 'Modelo',
              controller: model,
            ),
            UnderlineTextField(
              label: 'Ano',
              controller: year,
              keyboardType: TextInputType.number,
            ),
            UnderlineTextField(
              label: 'Placa',
              controller: plate,
            ),
            UnderlineTextField(
              label: 'Cor',
              controller: color,
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
              account.carManufacturer = manufacturer.value.text;
              account.carModel = model.value.text;
              account.carModelYear = int.parse(year.value.text);
              account.carPlate = plate.value.text;
              account.carColor = color.value.text;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _changeUserDetails(BuildContext context) {
  AccountModel account = Provider.of<AccountModel>(context, listen: false);
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
              account.setEmail = email.value.text;
              account.setPhoneNumber = phoneNumber.value.text;
              account.setFullLegalName = fullName.value.text;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
