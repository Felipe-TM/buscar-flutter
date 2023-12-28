import 'package:flutter/material.dart';

class Div extends StatelessWidget {
  const Div({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.onBackground.withAlpha(100);
    return SizedBox(
      width: 340,
      height: 20,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
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
          Positioned(
            left: 0,
            top: 10,
            child: Container(
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
          Positioned(
            left: 150,
            top: 10,
            child: Container(
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
        ],
      ),
    );
  }
}
