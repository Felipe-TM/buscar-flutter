import 'package:buscar/widgets/Login/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final Function onPressed;

  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkebleButton(
      onPressed: onPressed,
      child: Container(
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
              fixedSize: const MaterialStatePropertyAll(Size(125, 50)),
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Theme.of(context).colorScheme.onSecondary)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('lib/assets/google.png'),
              Text(
                'Google',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 13,
                  fontFamily: 'Istok Web',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
