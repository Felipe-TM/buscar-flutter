import 'package:flutter/material.dart';
import 'package:buscar/features/rides/ride_details/presentation/ride_details_screen.dart'; // Importe a tela RideDetailsScreen

enum RequestStatus {
  Pending,
  Accepted,
  Rejected,
}

class AcceptPassangerScreen extends StatefulWidget {
  @override
  _AcceptPassangerScreenState createState() => _AcceptPassangerScreenState();
}

class _AcceptPassangerScreenState extends State<AcceptPassangerScreen> {
  List<Map<String, dynamic>> requests = [
    {
      "origin": "Origem 1",
      "destination": "Destino 1",
      "date": "Data 1",
      "passangerRequests": "1",
      "status": RequestStatus.Pending,
    },
    {
      "origin": "Origem 2",
      "destination": "Destino 2",
      "date": "Data 2",
      "passangerRequests": "2",
      "status": RequestStatus.Pending,
    },
  ];

  void updateRequestStatus(int index, RequestStatus status) {
    setState(() {
      requests[index]['status'] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          var request = requests[index];
          return RequestTile(
            origin: request['origin'],
            destination: request['destination'],
            date: request['date'],
            passangerRequests: request['passangerRequests'],
            status: request['status'],
            onAccept: () => updateRequestStatus(index, RequestStatus.Accepted),
            onReject: () => updateRequestStatus(index, RequestStatus.Rejected),
          );
        },
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  final String origin;
  final String destination;
  final String date;
  final String passangerRequests;
  final RequestStatus status;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RequestTile({
    Key? key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.passangerRequests,
    required this.status,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

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
          if (status == RequestStatus.Pending)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Icon(Icons.info_outline, color: Colors.orange),
                ),
                const Text(
                  'Pendente',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          if (status == RequestStatus.Accepted)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Icon(Icons.check_circle, color: Colors.green),
                ),
                const Text(
                  'Aceito',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          if (status == RequestStatus.Rejected)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Icon(Icons.cancel, color: Colors.red),
                ),
                const Text(
                  'Recusado',
                  style: TextStyle(color: Colors.red),
                ),
              ],
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
              ),
            ),
            Text(date)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RideDetailsScreen(); // Navega para RideDetailsScreen ao clicar no tile
            },
          ),
        );
      },
      trailing: status == RequestStatus.Pending
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: onAccept,
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: onReject,
                ),
              ],
            )
          : null,
    );
  }
}
