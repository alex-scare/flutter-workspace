import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_animated_grid/src/grid_image_item.dart';
import 'package:styled_widget/styled_widget.dart';

class LastItem extends HookWidget {
  const LastItem({Key? key, required this.count, required this.url})
      : super(key: key);

  final int count;
  final String url;

  @override
  Widget build(BuildContext context) {
    var textColor = Theme.of(context).colorScheme.onBackground;
    var backgroundColor = Theme.of(context).colorScheme.background;

    return Stack(children: [
      Container(
          height: double.infinity,
          width: double.infinity,
          child: GridImageItem(url: url)),
      Text(
        '+$count',
        style: TextStyle(
            color: textColor.withOpacity(0.7),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ).center().backgroundColor(backgroundColor.withOpacity(0.5)),
    ]);
  }
}
