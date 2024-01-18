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
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
                    AppointmentTile(),
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
  const AppointmentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Para:'), Text('12/01/2024')],
                  ),
                  Text('Rua Olando Silva, n 845'),
                  Row(
                    children: [
                      Text('Saída:'),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('17:55'),
                      )
                    ],
                  ),
                  Text('Status:'),
                  Text('Em andamento')
                ]),
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
