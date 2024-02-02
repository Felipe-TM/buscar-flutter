import 'package:buscar/common_widgets/shrinkeble_button.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Column(
              children: [
                RequestTile(),
                RequestTile(),
                RequestTile(),
              ]
                  .map((widget) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  const RequestTile({
    super.key,
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
                Container(
                  width: 80,
                  height: 80,
                  decoration: const ShapeDecoration(
                      shape: OvalBorder(), color: Colors.grey),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('De: Rua das Nevez, 999'),
                    Text('Para: Av. São João, 1001'),
                    Text('Sáida: 15:21'),
                    Text('02/02/2024'),
                    Text('Status: Pendente'),
                  ],
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
