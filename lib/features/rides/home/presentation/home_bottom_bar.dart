import 'package:buscar/common_widgets/flat_icon_button.dart';
import 'package:buscar/features/rides/appointments/presentation/appointments_screen.dart';
import 'package:buscar/features/rides/history/presentation/history_screen.dart';
import 'package:buscar/features/rides/requests/presentation/requests_screen.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6),
          ],
        ),
        child: Row(
          children: [
            FlatIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentsScreen(),
                  ),
                );
              },
              label: const Text('Agenda'),
              icon: const Icon(Icons.calendar_month),
            ),
            FlatIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RequestsScreen(),
                  ),
                );
              },
              label: const Text('Solicitações'),
              icon: const Icon(Icons.list_alt),
            ),
            FlatIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              label: const Text('Histórico'),
              icon: const Icon(Icons.history),
            ),
          ].map((widget) => Expanded(child: widget)).toList(),
        ),
      ),
    );
  }
}
