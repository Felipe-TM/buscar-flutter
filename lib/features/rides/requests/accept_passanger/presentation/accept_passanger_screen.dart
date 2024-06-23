import 'package:buscar/common_widgets/loading_widget.dart';
import 'package:buscar/features/rides/requests/accept_passanger/presentation/request_tile.dart';
import 'package:flutter/material.dart';

class AcceptPassangerScreen extends StatefulWidget {
  const AcceptPassangerScreen({super.key});

  @override
  State<AcceptPassangerScreen> createState() => _AcceptPassangerScreenState();
}

class _AcceptPassangerScreenState extends State<AcceptPassangerScreen>
    with TickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    getRequests();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getRequests() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações de Passageiros'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Builder(builder: (context) {
        while (isLoading) {
          return LoadingWidget(
            controller: controller,
            label: Text('Carregando...'),
          );
        }

        return const SingleChildScrollView(
          child: Column(
            children: [
              RequestTile(
                  origin: 'Rua Orlando Silva, 845',
                  destination: 'Rua General Horta Barbosa, 123',
                  date: '12/12/2026',
                  passangerRequests: '1'),
            ],
          ),
        );
      }),
    );
  }
}
