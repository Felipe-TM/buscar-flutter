import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final double? size;

  const ActionIconButton(
      {super.key, required this.onPressed, required this.icon, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: icon,
      iconSize: size,
      color: Theme.of(context).colorScheme.onBackground,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              Theme.of(context).colorScheme.inversePrimary)),
    );
  }
}
