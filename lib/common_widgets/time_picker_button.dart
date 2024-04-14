import 'package:flutter/material.dart';

class TimePickerButton extends StatefulWidget {
  final Widget? label;
  final Icon icon;
  final TimeOfDay? time;

  const TimePickerButton(
      {super.key,
      this.label,
      this.icon = const Icon(Icons.av_timer),
      this.time});

  @override
  State<TimePickerButton> createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    if (widget.time != null) time = widget.time!;
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
        TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: time,
          initialEntryMode: TimePickerEntryMode.inputOnly,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );
        if (newTime == null) return;

        setState(() {
          time = newTime;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: widget.label,
          ),
          Text(time.to24hours()),
          widget.icon,
        ],
      ),
    );
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
