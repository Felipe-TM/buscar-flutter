import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRidePage4 extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;

  final TextStyle textStyle = const TextStyle(fontSize: 15);

  const AddRidePage4({super.key, this.onNext, this.onBack});

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
                child: Consumer<RideDetailsModel>(
                  builder: (BuildContext context, RideDetailsModel model,
                      Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'De: ${model.getOrigin}',
                          style: textStyle,
                        ),
                        Text(
                          'Para: ${model.getDestination}',
                          style: textStyle,
                        ),
                        Text(
                          'Saída: ${model.getDepartureTime}',
                          style: textStyle,
                        ),
                        Text(
                          'Chegada (Previsão): ${model.getArrivalTime}',
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
                          'Motorista: ${model.getDriverName}',
                          style: textStyle,
                        ),
                        Text(
                          'Carro: ${model.getCarManufacturer} ${model.getCarModel}',
                          style: textStyle,
                        ),
                        Text(
                          'Placa: ${model.getCarPlate}',
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
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
