import 'package:buscar/common_widgets/location_input_field.dart';
import 'package:flutter/material.dart';

class LocationInputBox extends StatelessWidget {
  final TextEditingController? originController;
  final TextEditingController? destinationController;
  final FocusNode? originFocusNode;
  final FocusNode? destinationFocusNode;

  const LocationInputBox(
      {super.key,
      this.originController,
      this.destinationController,
      this.originFocusNode,
      this.destinationFocusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationInputField(
              key: const Key('origin'),
              focusNode: originFocusNode,
              icon: Icons.home,
              hint: 'De onde?',
              controller: originController,
            ),
            LocationInputField(
              key: const Key('destination'),
              focusNode: destinationFocusNode,
              hint: 'Para onde?',
              controller: destinationController,
            ),
          ]
              .map((widget) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: widget,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
