import 'package:hive/hive.dart';

part 'likert_scale.g.dart';

@HiveType(typeId: 1)
class LikertScale extends HiveObject {
  @HiveField(0)
  final LikertScaleValue scale;

  LikertScale({
    required this.scale,
  });
}

@HiveType(typeId: 2)
enum LikertScaleValue {
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

  const LikertScaleValue(this.value);

  final int value;
}
