import 'package:flutter/material.dart';

class Div extends StatelessWidget {
  const Div({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.onBackground.withAlpha(100);
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: 30,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          child: Container(
            height: 1,
            width: 100,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: color,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontFamily: 'Istok Web',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.70,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            width: 100,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
