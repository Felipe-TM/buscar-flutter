import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(children: [
        Container(
          color: Colors.grey,
        ),
        const RideDetailsSheet(),
      ]),
    );
  }
}

class RideDetailsSheet extends StatelessWidget {
  final TextStyle textStyle = const TextStyle(fontSize: 15);

  const RideDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        maxChildSize: 0.7,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black38, blurRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      'De: Av. Dez de Dezembro, 865',
                      style: textStyle,
                    ),
                    Text(
                      'Para: Rua Lucilla Balalai, 456',
                      style: textStyle,
                    ),
                    Text(
                      'Saída: 11:45',
                      style: textStyle,
                    ),
                    Text(
                      'Chegada (Previsão): 12:21',
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
                      'Motorista: Zé da Manga',
                      style: textStyle,
                    ),
                    Text(
                      'Carro: BMW M3',
                      style: textStyle,
                    ),
                    Text(
                      'Placa: 8FG9DF',
                      style: textStyle,
                    ),
                    Text(
                      'Status: Esperando Motorista',
                      style: textStyle,
                    ),
                  ]
                      .map(
                        (widget) => Padding(
                          padding: EdgeInsets.only(top: 15),
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
