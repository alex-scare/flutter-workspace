import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:helpers/helpers.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends HookWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    var firstDay = DateTime(today.year, today.month - 3, today.day);
    var lastDay = DateTime(today.year, today.month + 3, today.day);

    final calendarFormat = useState(CalendarFormat.week);
    final selectedDayState = useState(today);
    final focusedDayState = useState(today);

    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      calendarFormat: calendarFormat.value,
      headerVisible: false,
      focusedDay: focusedDayState.value,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: cellBuilder,
        selectedBuilder: cellBuilder,
        outsideBuilder: cellBuilder,
        todayBuilder: cellBuilder,
      ),
      selectedDayPredicate: (day) {
        return isSameDay(selectedDayState.value, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (isSameDay(selectedDay, selectedDayState.value)) return;

        selectedDayState.value = selectedDay;
        focusedDayState.value = focusedDay;

        Future.delayed(const Duration(milliseconds: 10), () {
          calendarFormat.value = CalendarFormat.week;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      onFormatChanged: (format) {
        if (calendarFormat.value == format) return;

        calendarFormat.value = format;
      },
      onPageChanged: (focusedDay) {
        focusedDayState.value = focusedDay;
      },
      formatAnimationDuration: const Duration(milliseconds: 1),
      formatAnimationCurve: Curves.elasticInOut,
    );
  }
}

FocusedDayBuilder cellBuilder = (
  BuildContext context,
  DateTime day,
  DateTime focusedDay,
) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: const BoxDecoration(
      // color: context.colors.primaryContainer,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        '${day.day}',
        style: TextStyle(color: context.colors.onPrimaryContainer),
      ),
    ),
  );
};
