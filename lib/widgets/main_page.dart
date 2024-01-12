import 'package:buscar/widgets/buscar_title.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        leadingWidth: 70,
        leading: const LeadingIcon(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            iconSize: 52,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: BuscarTitle()),
            ListTile(
              title: Text('Agenda'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Solicitações'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Histórico'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Conta'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Configurações'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Sair', style: TextStyle(color: Colors.red)),
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ],
        ),
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          color: Colors.grey,
        ),
        Positioned(
            left: 20,
            bottom: 30,
            child: CustomIconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat),
            )),
        Positioned(
          right: 20,
          bottom: 30,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
              CustomIconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 6)
              ]),
          child: Row(
            children: [
              FlatTextButton(
                  onPressed: () {},
                  label: const Text('Agenda'),
                  icon: const Icon(Icons.calendar_month)),
              FlatTextButton(
                  onPressed: () {},
                  label: const Text('Solicitações'),
                  icon: const Icon(Icons.list_alt)),
              FlatTextButton(
                  onPressed: () {},
                  label: const Text('Histórico'),
                  icon: const Icon(Icons.history)),
            ].map((widget) => Expanded(child: widget)).toList(),
          ),
        ),
      ),
    );
  }
}

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 52,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.menu_rounded),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final double? size;

  const CustomIconButton(
      {super.key, required this.onPressed, required this.icon, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: icon,
      iconSize: size,
      color: Theme.of(context).colorScheme.onBackground,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              Theme.of(context).colorScheme.inversePrimary)),
    );
  }
}

class FlatTextButton extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final Widget label;
  final double width;
  final double height;

  const FlatTextButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.width = 88,
      this.height = 88,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          minimumSize: Size(width, height),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        onPressed: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, label]));
  }
}
