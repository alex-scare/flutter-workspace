import 'package:flutter/material.dart';

class HorizontalScrollableList<T> extends StatefulWidget {
  const HorizontalScrollableList({
    Key? key,
    required this.current,
    required this.changeCurrent,
    required this.items,
  }) : super(key: key);

  final T current;
  final void Function(int index) changeCurrent;
  final List<T> items;

  @override
  createState() => _HorizontalScrollableListState();
}

class _HorizontalScrollableListState extends State<HorizontalScrollableList> {
  var controller = PageController(
    viewportFraction: 1 / 6,
  );

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: widget.items.length,
      onPageChanged: (int index) => widget.changeCurrent(index),
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          child: Center(child: Text(index.toString())),
          onTap: () {
            widget.changeCurrent(index);
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        );
      },
    );
  }
}
