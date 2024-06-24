import 'package:buscar/common_widgets/action_icon_button.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/count_display_widget.dart';
import '../../home/presentation/chat_title.dart'; // Certifique-se de que o caminho está correto

class RideDetailsSheet extends StatefulWidget {
  const RideDetailsSheet({super.key});

  @override
  State<RideDetailsSheet> createState() => _RideDetailsSheetState();
}

class _RideDetailsSheetState extends State<RideDetailsSheet> {
  final TextStyle textStyle = const TextStyle(fontSize: 15);
  late bool isDriverView;

  @override
  void initState() {
    isDriverView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.18,
        maxChildSize: 0.80,
        minChildSize: 0.18,
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
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Consumer<RideDetailsModel>(
                        builder: (BuildContext context, RideDetailsModel ride,
                            Widget? child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'De: ${ride.origin}',
                                style: textStyle,
                              ),
                              Text(
                                'Para: ${ride.destination}',
                                style: textStyle,
                              ),
                              Text(
                                'Saída: ${ride.departureTime}',
                                style: textStyle,
                              ),
                              Text(
                                'Chegada (Previsão): ${ride.arrivalTime}',
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
                                'Motorista: ${ride.driverName}',
                                style: textStyle,
                              ),
                              Text(
                                'Carro: ${ride.carManufacturer} ${ride.carModel}',
                                style: textStyle,
                              ),
                              Text(
                                'Placa: ${ride.carPlate}',
                                style: textStyle,
                              ),
                              Text(
                                'Status: ${ride.status}',
                                style: textStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Builder(builder: (context) {
                                  return isDriverView
                                      ? Row(
                                          children: [
                                            CountDisplayWidget(
                                              child: ActionIconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatTitle(
                                                              title:
                                                                  'Motorista'),
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(
                                                    Icons.chat_outlined),
                                                size: 42,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            CountDisplayWidget(
                                              child: ActionIconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatTitle(
                                                              title:
                                                                  'Passageiro'),
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(
                                                    Icons.chat_outlined),
                                                size: 42,
                                              ),
                                            ),
                                          ],
                                        );
                                }),
                              )
                            ]
                                .map(
                                  (widget) => Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: widget,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 4,
                      width: 60,
                      child: Container(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: RideDetailsSheet(),
    ),
  ));
}
