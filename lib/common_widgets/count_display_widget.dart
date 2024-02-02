import 'package:flutter/material.dart';

class CountDisplayWidget extends StatefulWidget {
  final Widget child;

  const CountDisplayWidget({super.key, required this.child});

  @override
  State<CountDisplayWidget> createState() => _CountDisplayWidgetState();
}

class _CountDisplayWidgetState extends State<CountDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: widget.child,
        ),
        Positioned(
          right: 3,
          bottom: -3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '2',
                style: TextStyle(color: Theme.of(context).colorScheme.onError),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
