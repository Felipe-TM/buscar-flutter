import 'package:buscar/common_widgets/date_picker_button.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:buscar/common_widgets/time_picker_button.dart';
import 'package:buscar/features/account/account_details/repository/account_repository.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/navigation_button.dart';

class AddRidePage2 extends StatefulWidget {
  const AddRidePage2({
    super.key,
  });

  @override
  State<AddRidePage2> createState() => _AddRidePage2State();
}

class _AddRidePage2State extends State<AddRidePage2> {
  late TextEditingController _originController;
  late TextEditingController _destinationController;
  late double _numberOfPassangers;

  @override
  void initState() {
    _numberOfPassangers = 1;
    _originController = TextEditingController();
    _destinationController = TextEditingController();
    Provider.of<RideModel>(context, listen: false).setDepartureTime =
        TimeOfDay.now();
    Provider.of<RideModel>(context, listen: false).setArrivalTime =
        TimeOfDay.now();
    Provider.of<RideModel>(context, listen: false).setDate = DateTime.now();
    super.initState();
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
                    const Text('Passageiros:'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: _numberOfPassangers,
                              min: 1,
                              max: 4,
                              divisions: 3,
                              label: '${_numberOfPassangers.toInt()}',
                              onChanged: (newValue) {
                                setState(() {
                                  _numberOfPassangers = newValue;
                                  Provider.of<RideModel>(context, listen: false)
                                          .setNumberOfPassangers =
                                      _numberOfPassangers.toInt();
                                });
                              },
                            ),
                          ),
                          Text('${_numberOfPassangers.toInt()}')
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
            Consumer2<RideModel, AccountRepository>(
              builder: (BuildContext context, RideModel rideModel,
                  AccountRepository repository, Widget? child) {
                return NavigationButton(
                  onTap: () {
                    rideModel.setNumberOfPassangers =
                        _numberOfPassangers.toInt();
                    Provider.of<RideDetailsModel>(context, listen: false)
                        .cloneFromModel(
                            rideModel: rideModel, account: repository.account);
                    DefaultTabController.of(context).animateTo(2);
                  },
                  content: const Row(
                      children: [Text('Proximo'), Icon(Icons.arrow_forward)]),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
