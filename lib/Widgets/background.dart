import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class Background extends StatelessWidget {
  final Color color = Colors.white;
  final Color elipseColor = Color(0xFFA3F4FF);

  Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: color),
        child: Stack(children: [
          Positioned(
            top: -250,
            left: -70,
            child: Container(
              alignment: const Alignment(0, 0),
              child: InnerShadow(
                  blur: 5,
                  offset: const Offset(0, -2),
                  child: Container(
                    width: MediaQuery.of(context).size.width + 150,
                    height: MediaQuery.of(context).size.height / 1.8,
                    decoration: ShapeDecoration(
                      color: elipseColor,
                      shape: const OvalBorder(),
                    ),
                  )),
            ),
          )
        ]));
  }
}
