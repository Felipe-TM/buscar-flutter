import 'package:buscar/common_widgets/date_picker_button.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/navigation_button.dart';

class FindRidePage2 extends StatelessWidget {
  final String origin;
  final String destination;
  final Function()? onNext;
  final Function()? onBack;

  const FindRidePage2(
      {super.key,
      this.origin = '',
      this.destination = '',
      this.onNext,
      this.onBack});

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
              onTap: onBack,
              content:
                  const Row(children: [Icon(Icons.arrow_back), Text('Voltar')]),
            ),
            NavigationButton(
              onTap: onNext,
              content: const Row(
                  children: [Text('Proximo'), Icon(Icons.arrow_forward)]),
            ),
          ],
        )
      ],
    );
  }
}
