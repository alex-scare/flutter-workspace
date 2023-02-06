import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class IconListInputColors {
  final Color primary;
  final Color onPrimary;
  final Color onBackground;

  const IconListInputColors({
    required this.primary,
    required this.onPrimary,
    required this.onBackground,
  });
}

class IconListInput extends StatefulWidget {
  const IconListInput({
    Key? key,
    required this.options,
    required this.disabledOptions,
    required this.colors,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final IconData? initialValue;
  final List<IconData> options;
  final List<IconData> disabledOptions;
  final IconListInputColors colors;
  final void Function(IconData value) onChanged;

  @override
  State<IconListInput> createState() => _IconListInputState();
}

class _IconListInputState extends State<IconListInput> {
  IconData? value;

  @override
  void initState() {
    value = widget.initialValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 65,
        childAspectRatio: 1.0,
      ),
      itemCount: widget.options.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final IconData option = widget.options[index];
        final bool isSelected = option == value;
        final bool isDisabled = widget.disabledOptions.contains(option);

        getIconColor() {
          if (isSelected) return widget.colors.primary;
          if (isDisabled) return widget.colors.onBackground.withAlpha(40);
          return widget.colors.onBackground.withAlpha(200);
        }

        return GestureDetector(
          onTap: !isDisabled
              ? () {
                  widget.onChanged(option);
                  setState(() {
                    value = option;
                  });
                }
              : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? widget.colors.onPrimary : null,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      option,
                      color: getIconColor(),
                      size: 25,
                    ),
                  ),
                  if (isDisabled && !isSelected)
                    Center(
                      child: Icon(
                        LineIcons.ban,
                        color: widget.colors.primary.withAlpha(70),
                        size: 40,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
