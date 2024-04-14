import 'package:buscar/common_widgets/location_input_field.dart';
import 'package:flutter/material.dart';

class LocationInputBox extends StatelessWidget {
  const LocationInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LocationInputField(
              icon: Icons.home,
              hint: 'De onde?',
            ),
            const LocationInputField(
              hint: 'Para onde?',
            ),
          ]
              .map((widget) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: widget,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
