import 'package:buscar/Widgets/Login/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 90),
                child: Column(
                  children: [
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'Av. Juscelino Kubitscheck, 3080',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. Geraldo Francisco dos Santos',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                    AppointmentTile(
                      destination: 'R. João Ruíz, 290',
                      numberOfPassengers: '2',
                      departureTime: '14:25',
                      status: 'Pendente',
                      date: '22/01/2024',
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListFilters(),
        ],
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final String destination;
  final String numberOfPassengers;
  final String departureTime;
  final String status;
  final String date;

  const AppointmentTile({
    super.key,
    required this.destination,
    required this.numberOfPassengers,
    required this.departureTime,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkebleButton(
      shrinkScale: 0.95,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 150,
          width: 350,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Para:'),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            destination,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                        Text(date)
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Passageiros:'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(numberOfPassengers),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Saída:'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(departureTime),
                        )
                      ],
                    ),
                    const Text('Status:'),
                    Text(status)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ListFilters extends StatelessWidget {
  const ListFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.background.withOpacity(0),
            ],
            begin: const Alignment(0, 0.3),
            end: Alignment.bottomCenter,
            stops: const [0, 0.9]),
      ),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: const DropdownMenu<String>(
                  initialSelection: 'Hoje',
                  width: 120,
                  enableSearch: false,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 'Hoje',
                      label: 'Hoje',
                    ),
                    DropdownMenuEntry(
                        value: 'Semana',
                        label: 'Semana',
                        labelWidget: Text('Essa semana')),
                    DropdownMenuEntry(
                      value: 'mes',
                      label: 'Mês',
                      labelWidget: Text('Esse mês'),
                    )
                  ]),
            ),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: const DropdownMenu(
                  width: 150,
                  initialSelection: 'Passageiro',
                  enableSearch: false,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 'Passageiro',
                      label: 'Passageiro',
                      labelWidget: Text('Como Passageiro'),
                    ),
                    DropdownMenuEntry(
                      value: 'Motorista',
                      label: 'Motorista',
                      labelWidget: Text('Como motorista'),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
