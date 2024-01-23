import 'package:buscar/common_widgets/date_picker_button.dart';
import 'package:flutter/material.dart';

class HistoryFilters extends StatefulWidget {
  const HistoryFilters({
    super.key,
  });

  @override
  State<HistoryFilters> createState() => _HistoryFiltersState();
}

class _HistoryFiltersState extends State<HistoryFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.background.withOpacity(0),
            ],
            begin: const Alignment(0, 0.3),
            end: Alignment.bottomCenter,
            stops: const [0, 0.9]),
      ),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DatePickerButton(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Até'),
            ),
            DatePickerButton()
          ],
        ),
      ),
    );
  }
}
