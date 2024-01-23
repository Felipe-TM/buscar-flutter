import 'package:flutter/material.dart';

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
                ],
              ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
