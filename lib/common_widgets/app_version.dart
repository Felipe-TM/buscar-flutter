import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
    required this.appVer,
  });

  final String appVer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.6),
      height: 30,
      child: Text('Version $appVer',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withAlpha(180),
            fontSize: 12,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w600,
            height: 0,
            decoration: TextDecoration.none,
            letterSpacing: 0.55,
          )),
    );
  }
}
