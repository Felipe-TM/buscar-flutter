import 'package:flutter/material.dart';

class MyRequestsScreen extends StatefulWidget {
  const MyRequestsScreen({super.key});

  @override
  _MyRequestsScreenState createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
  List<Map<String, dynamic>> requests = [
    {
      "origin": "Rua Orlando Silva, 845",
      "destination": "Rua General Horta Barbosa, 123",
      "date": "12/12/2026",
      "status": "Pendente",
      "isLoading": false,
    },
  ];

  void updateRequestStatus(int index, String status) {
    setState(() {
      requests[index]['status'] = status;
    });
  }

  void _showAcceptDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aceitar Passageiro'),
          content: const Text('Você deseja aceitar este passageiro?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Passageiro recusado');
                updateRequestStatus(index, 'Recusado');
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Passageiro aceito com sucesso');
                updateRequestStatus(index, 'Aceito');
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aceitar Passageiros'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: requests.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> request = entry.value;
            return RequestTile(
              origin: Text(request['origin']),
              destination: Text(request['destination']),
              date: Text(request['date']),
              status: Text(request['status']),
              isLoading: request['isLoading'],
              onAccept: () => _showAcceptDialog(context, index),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  final Text origin;
  final Text destination;
  final Text date;
  final Text status;
  final bool isLoading;
  final VoidCallback onAccept;

  const RequestTile({
    Key? key,
    required this.origin,
    required this.destination,
    required this.date,
    required this.status,
    required this.isLoading,
    required this.onAccept,
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
            child: origin,
          ),
          status,
          const Padding(
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Icon(Icons.group),
          ),
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
              child: destination,
            ),
            date,
          ],
        ),
      ),
      trailing: isLoading
          ? CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: onAccept,
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyRequestsScreen(),
  ));
}
