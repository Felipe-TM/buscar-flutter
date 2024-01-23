import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class Background extends StatelessWidget {
  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.background;

    if (MediaQuery.of(context).size.height < 750) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: color),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: color),
      child: Stack(
        children: [
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
                    color: Theme.of(context).colorScheme.inversePrimary,
                    shape: const OvalBorder(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
