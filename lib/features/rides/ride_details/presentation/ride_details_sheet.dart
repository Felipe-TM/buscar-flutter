import 'package:buscar/common_widgets/action_icon_button.dart';
import 'package:flutter/material.dart';

class RideDetailsSheet extends StatelessWidget {
  final TextStyle textStyle = const TextStyle(fontSize: 15);
  final String origin;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String rideStatus;

  final String driverName;
  final String carModel;
  final String carManufacturer;
  final String carPlate;

  const RideDetailsSheet(
      {super.key,
      required this.origin,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.rideStatus,
      required this.driverName,
      required this.carModel,
      required this.carManufacturer,
      required this.carPlate});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.15,
        maxChildSize: 0.6,
        minChildSize: 0.15,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black38, blurRadius: 5)
                ]),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 60,
                        height: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'De: $origin',
                      style: textStyle,
                    ),
                    Text(
                      'Para: $destination',
                      style: textStyle,
                    ),
                    Text(
                      'Saída: $departureTime',
                      style: textStyle,
                    ),
                    Text(
                      'Chegada (Previsão): $arrivalTime',
                      style: textStyle,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Motorista: $driverName',
                      style: textStyle,
                    ),
                    Text(
                      'Carro: $carManufacturer $carModel',
                      style: textStyle,
                    ),
                    Text(
                      'Placa: $carPlate',
                      style: textStyle,
                    ),
                    Text(
                      'Status: $rideStatus',
                      style: textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ActionIconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_outlined),
                        size: 42,
                      ),
                    )
                  ]
                      .map(
                        (widget) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: widget,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}