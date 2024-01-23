import 'package:flutter/material.dart';

class FlatIconButton extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final Widget label;
  final double width;
  final double height;

  const FlatIconButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.width = 88,
      this.height = 88,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          minimumSize: Size(width, height),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        onPressed: onPressed,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, label]));
  }
}
