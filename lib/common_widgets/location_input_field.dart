import 'package:flutter/material.dart';

class LocationInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const LocationInputField(
      {super.key,
      this.icon = Icons.location_on_outlined,
      required this.hint,
      this.controller,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
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
