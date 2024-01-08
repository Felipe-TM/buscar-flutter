import 'package:buscar/widgets/login_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.background,
        leadingWidth: 70,
        leading: IconButton(
          iconSize: 52,
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
