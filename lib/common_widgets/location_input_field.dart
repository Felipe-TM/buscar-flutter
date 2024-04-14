import 'package:flutter/material.dart';

class LocationInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String initialValue;

  const LocationInputField(
      {super.key,
      this.icon = Icons.location_on_outlined,
      required this.hint,
      this.initialValue = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          border: const OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
