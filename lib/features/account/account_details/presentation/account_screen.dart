import 'package:flutter/material.dart';

import 'account_details.dart';
import 'account_hero.dart';
import 'vehicle_details.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
