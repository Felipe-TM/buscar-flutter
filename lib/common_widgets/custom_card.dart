import 'package:buscar/common_widgets/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final Widget child;

  const CustomCard({
    super.key,
    required this.color,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkebleButton(
      shrinkScale: 0.95,
      duration: const Duration(milliseconds: 400),
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: color, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5), blurRadius: 2, color: Colors.black26)
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
