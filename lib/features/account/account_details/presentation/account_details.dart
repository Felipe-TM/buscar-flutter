import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  final String fullLegalName;
  final String email;
  final String phoneNumber;

  final TextStyle textStyle = const TextStyle(fontSize: 16);

  const AccountDetails({
    super.key,
    required this.fullLegalName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fullLegalName, style: textStyle),
        Text(email, style: textStyle),
        Text(phoneNumber, style: textStyle),
      ],
    );
  }
}
