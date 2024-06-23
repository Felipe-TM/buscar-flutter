import 'package:buscar/common_widgets/navigation_button.dart';
import 'package:buscar/features/rides/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class AcceptRequest extends StatelessWidget {
  const AcceptRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aceitar Passageiro"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            Icon(Icons.star)
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Gostaria de compartilhar uma carona.",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AcceptedPage();
                    },
                  ),
                );
              },
              content: const Text('Aceitar'),
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: NavigationButton(
                onTap: () {},
                content: const Text('Recusar'),
                color: Colors.red,
              ),
            )
          ],
        )
      ])),
    );
  }
}

class AcceptedPage extends StatelessWidget {
  const AcceptedPage({super.key});

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
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
              child: const Text('Finalizar')),
        ),
      ],
    ));
  }
}
