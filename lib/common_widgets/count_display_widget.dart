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
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
