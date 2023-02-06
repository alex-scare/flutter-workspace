import 'package:hive/hive.dart';

part 'mood.g.dart';

@HiveType(typeId: 1)
class Mood extends HiveObject {
  @HiveField(0)
  final MoodType type;

  Mood({
    required this.type,
  });
}

@HiveType(typeId: 2)
enum MoodType {
  @HiveField(0)
  stronglyDisagree(-2),
  @HiveField(1)
  disagree(-1),
  @HiveField(2)
  neutral(0),
  @HiveField(3)
  agree(1),
  @HiveField(4)
  stronglyAgree(2);

  const MoodType(this.value);

  final int value;
}
