import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountHero(
                userRating: '4,5',
                userName: 'Felipe Torres',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 25),
                child: AccountDetails(
                    fullLegalName: 'Felipe Torres Maciel',
                    email: 'felipemaciel@exemplo.com',
                    phoneNumber: '+55 43 99912345678'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar')),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: VehicleDetails(
                  manufacturer: 'BMW',
                  model: '325i',
                  modelYear: 2011,
                  plate: 'DAI9625',
                  color: 'Preto',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  final String fullLegalName;
  final String email;
  final String phoneNumber;

  final TextStyle textStyle = const TextStyle(fontSize: 16);

  const AccountDetails({
    super.key,
    required this.fullLegalName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fullLegalName, style: textStyle),
        Text(email, style: textStyle),
        Text(phoneNumber, style: textStyle),
      ],
    );
  }
}

class VehicleDetails extends StatelessWidget {
  final String manufacturer;
  final String model;
  final int modelYear;
  final String plate;
  final String color;

  final TextStyle textStyle = const TextStyle(fontSize: 16);

  const VehicleDetails({
    super.key,
    required this.manufacturer,
    required this.model,
    required this.modelYear,
    required this.plate,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Informações do Veiculo',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(manufacturer, style: textStyle),
                  Text(model, style: textStyle),
                  Text(modelYear.toString(), style: textStyle),
                  Text(plate, style: textStyle),
                  Text(color, style: textStyle),
                ],
              ),
              const SizedBox(
                height: 110,
                width: 110,
                child: ColoredBox(
                  color: Colors.grey,
                  child: Icon(
                    Icons.car_crash,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class AccountHero extends StatelessWidget {
  final String userRating;
  final String userName;
  final Image? userPicture;

  const AccountHero({
    super.key,
    required this.userRating,
    required this.userName,
    this.userPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
              width: 180,
              height: 180,
              decoration: const ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: OvalBorder(),
              ),
              child: const Icon(
                Icons.account_circle,
                size: 180,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          userName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.star), Text(userRating)],
      )
    ]);
  }
}
