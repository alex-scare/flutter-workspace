import 'package:feelflow/models/mood/likert_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:helpers/helpers.dart';
import 'package:line_icons/line_icons.dart';
import 'package:styled_widget/styled_widget.dart';

class LikertRadio extends HookWidget {
  const LikertRadio({Key? key, required this.value}) : super(key: key);

  final ValueNotifier<LikertScaleValue> value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: scaleIconsMap.entries.map((entry) {
        return GestureDetector(
          onTap: () => value.value = entry.key,
          child: Styled.icon(
            entry.value,
            color: value.value == entry.key
                ? scaleColorsMap[entry.key]
                : context.colors.onBackground.withOpacity(0.5),
            size: 40,
            animate: true,
          )
              .padding(vertical: 5)
              .animate(const Duration(milliseconds: 300), Curves.easeInOut),
        );
      }).toList(),
    );
  }
}

Map<LikertScaleValue, IconData> scaleIconsMap = {
  LikertScaleValue.stronglyAgree: LineIcons.grinningFace,
  LikertScaleValue.agree: LineIcons.smilingFace,
  LikertScaleValue.neutral: LineIcons.neutralFace,
  LikertScaleValue.disagree: LineIcons.frowningFace,
  LikertScaleValue.stronglyDisagree: LineIcons.loudlyCryingFace,
};

typedef LikertScaleColorPalette = Map<LikertScaleValue, Color>;

extension LikertScaleColorPaletteExtension on LikertScaleColorPalette {
  LikertScaleColorPalette get opposite => {
        for (var entry in entries)
          entry.key: entry.value.withOpacity(isLightToDark ? 1.0 : 0.7)
      };

  bool get isLightToDark => values.first.opacity == 0.7;
}

LikertScaleColorPalette scaleColorsMap = {
  LikertScaleValue.stronglyAgree: const Color(0xFF81C784),
  LikertScaleValue.agree: const Color(0xFFA5D6A7),
  LikertScaleValue.neutral: const Color(0xFF90CAF9),
  LikertScaleValue.disagree: const Color(0xFFF06292),
  LikertScaleValue.stronglyDisagree: const Color(0xFFE57373),
};
