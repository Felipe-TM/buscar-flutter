import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  final String manufacturer;
  final String model;
  final int modelYear;
  final String plate;
  final String color;

  final TextStyle textStyle = const TextStyle(fontSize: 16);

  const VehicleDetails({
    super.key,
    required this.manufacturer,
    required this.model,
    required this.modelYear,
    required this.plate,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Informações do Veiculo',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(manufacturer, style: textStyle),
                  Text(model, style: textStyle),
                  Text(modelYear.toString(), style: textStyle),
                  Text(plate, style: textStyle),
                  Text(color, style: textStyle),
                ],
              ),
              const SizedBox(
                height: 110,
                width: 110,
                child: ColoredBox(
                  color: Colors.grey,
                  child: Icon(
                    Icons.car_crash,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
