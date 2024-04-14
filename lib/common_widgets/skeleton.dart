import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double height;
  final double width;

  const Skeleton({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
  }
}
