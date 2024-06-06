import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.controller,
    this.label,
  });

  final AnimationController controller;
  final Text? label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Builder(builder: (context) {
            if (label != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: controller.value,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: label!,
                  )
                ],
              );
            }
            return CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            );
          }),
        ),
      ),
    );
  }
}
