import 'package:buscar/features/rides/requests/accept_passanger/presentation/accept_request.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {
  final String origin;
  final String destination;
  final String date;
  final String passangerRequests;

  const RequestTile({
    super.key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.passangerRequests,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.home,
            size: 22,
          ),
          Expanded(
            child: Text(
              'De: $origin',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5, left: 5),
                child: Icon(Icons.group),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    passangerRequests,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.place,
              size: 20,
            ),
            Expanded(
                child: Text(
              'Para: $destination',
              overflow: TextOverflow.ellipsis,
            )),
            Text(date)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AcceptRequest();
            },
          ),
        );
      },
    );
  }
}
