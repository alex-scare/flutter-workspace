import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:image_animated_grid/src/grid_image_item.dart';
import 'package:image_animated_grid/src/last_item.dart';
import 'package:image_animated_grid/src/presets.dart';

class ImageAnimatedGrid extends HookWidget {
  const ImageAnimatedGrid({
    Key? key,
    required this.images,
  }) : super(key: key);

  /// Max length of [images] is 9 for now. Pass List of images url.
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    var mainImages = useState<List<String>>([]);
    var otherImages = useState<List<String>>([]);
    var isFullscreen = useState<bool>(false);

    useEffect(() {
      var delimiterIndex = images.length > 9 ? 9 : images.length;
      mainImages.value = images.sublist(0, delimiterIndex);

      if (images.length > delimiterIndex) {
        otherImages.value = images.sublist(delimiterIndex + 1);
      }
      return null;
    }, [images]);

    return LayoutGrid(
      areas: presets[mainImages.value.length] ?? presets[1]!,
      columnSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
      rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
      rowGap: 2.0,
      columnGap: 2.0,
      gridFit: GridFit.loose,
      children: mainImages.value.map((e) {
        var index = mainImages.value.indexOf(e);
        var url = mainImages.value[index];
        var isShowMore = index + 1 == mainImages.value.length &&
            otherImages.value.isNotEmpty;

        return Container(
          width: double.infinity,
          height: double.infinity,
          child: GestureDetector(
            onTap: () => isFullscreen.value = !isFullscreen.value,
            child: isShowMore
                ? LastItem(count: otherImages.value.length, url: url)
                : GridImageItem(url: url),
          ),
        ).inGridArea(gridPositionName[index]);
      }).toList(),
    );
  }
}

enum ImageAnimatedGridType { link }

const gridPositionName = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
];
