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
        text: const TextSpan(
            text: 'Bus',
            style: TextStyle(
              color: Color(0xFF7D7D7D),
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
                  color: Color(0xFF3FDFF5),
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
