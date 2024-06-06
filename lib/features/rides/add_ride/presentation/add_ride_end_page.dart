import 'package:buscar/common_widgets/loading_widget.dart';
import 'package:buscar/features/rides/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class AddRideEndPage extends StatefulWidget {
  const AddRideEndPage({super.key});

  @override
  State<AddRideEndPage> createState() => _AddRideEndPageState();
}

class _AddRideEndPageState extends State<AddRideEndPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oferecer Carona'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Builder(builder: (context) {
        return isLoading
            ? LoadingWidget(
                controller: controller,
                label: const Text(
                  'Enviando',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : Center(
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
                      'Oferta de Carona enviada com sucesso',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('N. 123456978'),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.copy)),
                        ),
                      ],
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
      }),
    );
  }
}
