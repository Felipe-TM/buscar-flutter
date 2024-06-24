import 'package:flutter/material.dart';
import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:buscar/features/rides/home/presentation/home_screen.dart';

enum RequestStatus {
  Pending,
  Accepted,
  Rejected,
}

class AcceptRequest extends StatefulWidget {
  const AcceptRequest({Key? key}) : super(key: key);

  @override
  _AcceptRequestState createState() => _AcceptRequestState();
}

class _AcceptRequestState extends State<AcceptRequest> {
  RequestStatus status = RequestStatus.Pending; // Estado inicial: pendente

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aceitar Passageiro"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 152,
            ),
            const Text(
              "Thiago Vinicius",
              style: TextStyle(fontSize: 25),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "4.9",
                  style: TextStyle(fontSize: 18),
                ),
                const Icon(Icons.star)
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Gostaria de compartilhar uma carona.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (status == RequestStatus.Pending)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigationButton(
                    onTap: () {
                      setState(() {
                        status = RequestStatus.Accepted;
                      });
                    },
                    content: const Text('Aceitar'),
                    color: Colors.green,
                  ),
                  const SizedBox(width: 50),
                  NavigationButton(
                    onTap: () {
                      setState(() {
                        status = RequestStatus.Rejected;
                      });
                    },
                    content: const Text('Recusar'),
                    color: Colors.red,
                  ),
                ],
              ),
            if (status == RequestStatus.Accepted)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: AcceptedPage(),
              ),
            if (status == RequestStatus.Rejected)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: RejectedPage(),
              ),
          ],
        ),
      ),
    );
  }
}

class AcceptedPage extends StatelessWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 72,
            color: Colors.green,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Solicitação aceita com sucesso',
              style: TextStyle(fontSize: 16, inherit: false),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Finalizar'),
            ),
          ),
        ],
      ),
    );
  }
}

class RejectedPage extends StatelessWidget {
  const RejectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cancel_rounded,
            size: 72,
            color: Colors.red,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Solicitação recusada',
              style: TextStyle(fontSize: 16, inherit: false),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Finalizar'),
            ),
          ),
        ],
      ),
    );
  }
}
