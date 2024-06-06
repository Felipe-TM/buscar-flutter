import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:flutter/material.dart';

class FindRidePage4 extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  final RideDetailsModel model;

  final TextStyle textStyle = const TextStyle(fontSize: 15);
  const FindRidePage4(
      {super.key, this.onBack, this.onNext, required this.model});

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
                    const Row(
                      children: [
                        Icon(
                          Icons.add_road,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Dados da corrida:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'De: ${model.getOrigin}',
                      style: textStyle,
                    ),
                    Text(
                      'Para: ${model.getDestination}',
                      style: textStyle,
                    ),
                    Text(
                      'Data: ${model.getDate}',
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
                    Text(
                      'Quantidade de passageiros: ${model.getNumberOfPassangers}',
                      style: textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_taxi,
                            color: Colors.green,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Dados do motorista:',
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Motorista: ${model.getDriverName}',
                      style: textStyle,
                    ),
                    Text(
                      'Status da corrida: ${model.getStatus}',
                      style: textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NavigationButton(
                            onTap: () {
                              Navigator.pop(context);
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
