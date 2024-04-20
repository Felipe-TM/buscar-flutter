import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class FindRidePage4 extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;

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

  const FindRidePage4(
      {super.key,
      required this.origin,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.rideStatus,
      required this.driverName,
      required this.carModel,
      required this.carManufacturer,
      required this.carPlate,
      this.onNext,
      this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 5)]),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NavigationButton(
                            onTap: () {
                              DefaultTabController.of(context).animateTo(2);
                            },
                            content: const Row(children: [
                              Icon(Icons.arrow_back),
                              Text('Voltar')
                            ]),
                          ),
                          NavigationButton(
                            onTap: () {},
                            content: const Row(children: [
                              Text('Solicitar'),
                            ]),
                          ),
                        ],
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
          ),
        ],
      ),
    );
  }
}
