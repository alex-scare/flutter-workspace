import 'package:feelflow/models/mood/likert_scale.dart';
import 'package:hive/hive.dart';
import 'package:helpers/helpers.dart';

part 'day.g.dart';

@HiveType(typeId: 0)
class Day extends HiveObject {
  @override
  @HiveField(0)
  late String key;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final LikertScale scale;

  Day({
    required this.date,
    required this.scale,
  }) {
    key = date.truncate().toDateString();
  }
}
