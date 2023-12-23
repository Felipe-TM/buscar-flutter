import 'package:flutter/material.dart';

class ShrinkebleButton extends StatefulWidget {
  final Widget child;
  final double shrinkScale;
  final Duration duration;
  final Function onPressed;

  const ShrinkebleButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.shrinkScale = 0.8,
    this.duration = const Duration(milliseconds: 150),
  });

  @override
  State<StatefulWidget> createState() => _ShrinkebleButtonState();
}

class _ShrinkebleButtonState extends State<ShrinkebleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future.delayed(const Duration(milliseconds: 150), () {
          _controller.reverse();
        });
        widget.onPressed();
      },
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: widget.shrinkScale,
        ).animate(_controller),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
