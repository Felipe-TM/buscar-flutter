import 'package:buscar/common_widgets/buscar_title.dart';
import 'package:buscar/features/account/account_details/presentation/account_screen.dart';
import 'package:buscar/features/account/configuration/presentation/configuration_screen.dart';
import 'package:buscar/features/rides/appointments/presentation/appointments_screen.dart';
import 'package:buscar/features/rides/history/presentation/history_screen.dart';
import 'package:buscar/features/rides/requests/presentation/requests_screen.dart';
import 'package:buscar/features/rides/home/presentation/chat_screen.dart'; // Importar ChatScreen
import 'package:flutter/material.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(child: BuscarTitle()),
        ListTile(
          title: const Text('Agenda'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AppointmentsScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Solicitações'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RequestsScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Histórico'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Chat'), // Adicionar a opção CHAT
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(), // Navegar para ChatScreen
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Conta'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Configurações'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConfigurationScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Sair', style: TextStyle(color: Colors.red)),
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ],
    );
  }
}
