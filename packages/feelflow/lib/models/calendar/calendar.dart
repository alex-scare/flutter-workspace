import 'package:feelflow/models/day/day.dart';
import 'package:hive/hive.dart';

part 'calendar.g.dart';

@HiveType(typeId: 3)
class Calendar extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Map<String, Day> days;

  Calendar({
    required this.name,
    required this.days,
  });
}
