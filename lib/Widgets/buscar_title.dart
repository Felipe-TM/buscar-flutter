import 'package:flutter/material.dart';

class BuscarTitle extends StatelessWidget {
  const BuscarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 90,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Bus',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(200),
              fontSize: 56,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 2.80,
            ),
            children: [
              TextSpan(
                text: 'Car',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 56,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 2.80,
                ),
              )
            ]),
      ),
    );
  }
}
