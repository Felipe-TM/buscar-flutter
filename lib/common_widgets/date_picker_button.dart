import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final Widget? label;
  final Icon icon;

  const DatePickerButton(
      {super.key, this.label, this.icon = const Icon(Icons.calendar_month)});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        fixedSize: const Size(130, 50),
        padding: const EdgeInsets.all(15),
        side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2023),
            lastDate: DateTime(2050));

        if (newDate == null) return;

        setState(() {
          date = newDate;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: widget.label,
          ),
          Text('${date.day}/${date.month}/${date.year}'),
          widget.icon,
        ],
      ),
    );
  }
}
