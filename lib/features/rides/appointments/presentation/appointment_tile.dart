import 'package:buscar/common_widgets/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class AppointmentTile extends StatelessWidget {
  final String destination;
  final String numberOfPassengers;
  final String departureTime;
  final String status;
  final String date;
  final Function onPressed;

  const AppointmentTile({
    super.key,
    required this.destination,
    required this.numberOfPassengers,
    required this.departureTime,
    required this.status,
    required this.date,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkebleButton(
      shrinkScale: 0.95,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 150,
          width: 350,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Para:'),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            destination,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(date)
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Passageiros:'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(numberOfPassengers),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Saída:'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(departureTime),
                      )
                    ],
                  ),
                  const Text('Status:'),
                  Text(status)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
