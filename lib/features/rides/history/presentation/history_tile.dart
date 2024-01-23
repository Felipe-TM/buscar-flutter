import 'package:flutter/material.dart';

class HistoryListTile extends StatelessWidget {
  final String origin;
  final String destination;
  final String date;
  final String rideRating;

  const HistoryListTile({
    super.key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.rideRating,
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
                child: Icon(Icons.star),
              ),
              Text(rideRating)
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
      onTap: () {},
    );
  }
}
