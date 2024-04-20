import 'package:buscar/common_widgets/date_picker_button.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/navigation_button.dart';

class FindRidePage2 extends StatefulWidget {
  final String origin;
  final String destination;

  const FindRidePage2({
    super.key,
    this.origin = '',
    this.destination = '',
  });

  @override
  State<FindRidePage2> createState() => _FindRidePage2State();
}

class _FindRidePage2State extends State<FindRidePage2> {
  late double _searchRadius;

  @override
  void initState() {
    _searchRadius = 1000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LocationInputBox(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Selecione a data:'),
                  DatePickerButton(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Horario de saida:'),
                  TimePickerButton(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Horario de Chegada:'),
                  TimePickerButton(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Janela de Tempo:'),
                  TimePickerButton(
                    time: TimeOfDay(hour: 0, minute: 10),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Area de Busca:'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: _searchRadius,
                              min: 500,
                              max: 8500,
                              divisions: 4,
                              label: '$_searchRadius',
                              onChanged: (newValue) {
                                setState(() {
                                  _searchRadius = newValue;
                                });
                              },
                            ),
                          ),
                          Text('$_searchRadius m')
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: widget,
                    ))
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationButton(
              onTap: () {
                DefaultTabController.of(context).animateTo(0);
              },
              content:
                  const Row(children: [Icon(Icons.arrow_back), Text('Voltar')]),
            ),
            NavigationButton(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
              },
              content: const Row(
                  children: [Text('Proximo'), Icon(Icons.arrow_forward)]),
            ),
          ],
        )
      ],
    );
  }
}
