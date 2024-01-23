import 'package:flutter/material.dart';

class AccountHero extends StatelessWidget {
  final String userRating;
  final String userName;
  final Image? userPicture;

  const AccountHero({
    super.key,
    required this.userRating,
    required this.userName,
    this.userPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: 180,
              height: 180,
              decoration: const ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: OvalBorder(),
              ),
              child: const Icon(
                Icons.account_circle,
                size: 180,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            userName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(userRating)
          ],
        )
      ],
    );
  }
}
