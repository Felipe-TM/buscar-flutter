import 'package:buscar/common_widgets/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {
  final String name;
  final String rating;
  final String origin;
  final String destination;
  final String departureTime;
  final String departureDate;
  final String status;

  const RequestTile({
    super.key,
    required this.name,
    required this.rating,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.departureDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ShrinkebleButton(
      shrinkScale: 0.95,
      onPressed: () {},
      child: SizedBox(
        height: 150,
        width: 370,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const ShapeDecoration(
                          shape: OvalBorder(), color: Colors.grey),
                      child: const Icon(
                        Icons.account_circle,
                        size: 80,
                      ),
                    ),
                    Text(name),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(rating),
                        const Icon(
                          Icons.star,
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('De: $origin', overflow: TextOverflow.ellipsis),
                      Text('Para: $destination',
                          overflow: TextOverflow.ellipsis),
                      Text('Sáida: $departureTime',
                          overflow: TextOverflow.ellipsis),
                      Text(departureDate, overflow: TextOverflow.ellipsis),
                      Text('Status: $status', overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text('Cancelar'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
