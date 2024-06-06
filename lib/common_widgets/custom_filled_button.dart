import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  final Widget child;
  final Size size;

  const CustomFilledButton(
      {super.key, required this.child, this.size = const Size(125, 50)});

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.all(Radius.circular(10.0)))),
      child: FilledButton(
        onPressed: null,
        style: ButtonStyle(
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(10.0)))),
            fixedSize: MaterialStatePropertyAll(widget.size),
            foregroundColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.background),
            backgroundColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.inversePrimary)),
        child: widget.child,
      ),
    );
  }
}
