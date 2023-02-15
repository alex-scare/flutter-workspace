import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ImageAnimatedGrid extends HookWidget {
  const ImageAnimatedGrid({
    Key? key,
    required this.images,
    // add assetr on length 9 as max
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    var state = useState<List<String>>([]);

    useEffect(() {
      state.value = list.sublist(0, images.length);
      return null;
    }, [images]);

    return LayoutGrid(
      areas: presets[images.length] ?? presets[1]!,
      columnSizes: [auto, auto, auto, auto, auto, auto],
      rowSizes: [auto, auto, auto, auto, auto, auto],
      rowGap: 2.0,
      columnGap: 2.0,
      children: state.value.map((e) {
        var index = state.value.indexOf(e);
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(images[index], fit: BoxFit.cover),
        ).inGridArea(list[index]);
      }).toList(),
    );
  }
}

const list = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  // 'ten',
];

const presets = {
  1: '''
    one one one one one one
    one one one one one one
    one one one one one one
    one one one one one one
    one one one one one one
    one one one one one one
  ''',
  2: '''
    one one one two two two
    one one one two two two
    one one one two two two
    one one one two two two
    one one one two two two
    one one one two two two
  ''',
  3: '''
    one one one one one one
    one one one one one one
    one one one one one one
    two two two three three three
    two two two three three three
    two two two three three three
  ''',
  4: '''
    one one one two two two
    one one one two two two
    one one one two two two
    three three three four four four
    three three three four four four
    three three three four four four
  ''',
  5: '''
    one one one two two two
    one one one two two two
    one one one two two two
    three three four four five five
    three three four four five five
    three three four four five five
 ''',
  6: '''
    one one two two three three
    one one two two three three
    one one two two three three
    four four five five six six
    four four five five six six
    four four five five six six
  ''',
  7: '''
    one one two two three three
    one one two two three three
    four four five five six six
    four four five five six six
    seven seven seven seven seven seven
    seven seven seven seven seven seven
  ''',
  8: '''
    one one one two two two
    one one one two two two
    three three three four four four
    three three three four four four
    five five seven seven eight eight
    five five seven seven eight eight
  ''',
  9: '''
    one one two two three three
    one one two two three three
    four four five five six six
    four four five five six six 
    seven seven eight eight nine nine
    seven seven eight eight nine nine
  ''',
};
