import 'package:buscar/common_widgets/date_picker_button.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/navigation_button.dart';

class FindRidePage2 extends StatefulWidget {
  const FindRidePage2({
    super.key,
  });

  @override
  State<FindRidePage2> createState() => _FindRidePage2State();
}

class _FindRidePage2State extends State<FindRidePage2> {
  late TextEditingController _originController;
  late TextEditingController _destinationController;
  late double _searchRadius;

  @override
  void initState() {
    _searchRadius = 1000;
    _originController = TextEditingController();
    _destinationController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RideModel>(context, listen: false).departureTime =
        TimeOfDay.now();
    Provider.of<RideModel>(context, listen: false).arrivalTime =
        TimeOfDay.now();
    Provider.of<RideModel>(context, listen: false).date = DateTime.now();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<RideModel>(
          builder: (BuildContext context, RideModel rideModel, Widget? child) {
            _originController.value =
                TextEditingValue(text: rideModel.getOrigin);
            _destinationController.value =
                TextEditingValue(text: rideModel.getDestination);
            return LocationInputBox(
              originController: _originController,
              destinationController: _destinationController,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Selecione a data:'),
                  DatePickerButton(
                    getDate: (date) {
                      Provider.of<RideModel>(context, listen: false).setDate =
                          date;
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Horario de saida:'),
                  TimePickerButton(
                    getTime: (time) {
                      Provider.of<RideModel>(context, listen: false)
                          .setDepartureTime = time;
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Horario de Chegada:'),
                  TimePickerButton(
                    getTime: (time) {
                      Provider.of<RideModel>(context, listen: false)
                          .setArrivalTime = time;
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Janela de Tempo:'),
                  TimePickerButton(
                    time: const TimeOfDay(hour: 0, minute: 10),
                    getTime: (time) {
                      Provider.of<RideModel>(context, listen: false)
                          .setTimeWindow = time;
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Area de Busca:'),
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
                                  Provider.of<RideModel>(context, listen: false)
                                      .setSearchRadius = _searchRadius;
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
