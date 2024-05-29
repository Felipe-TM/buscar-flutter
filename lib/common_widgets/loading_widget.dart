import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.round,
            value: controller.value,
            semanticsLabel: 'Circular progress indicator',
          ),
        ),
      ),
    );
  }
}
