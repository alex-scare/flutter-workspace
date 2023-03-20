import 'package:flutter/material.dart';

class VerticalScrollableList<T> extends StatefulWidget {
  const VerticalScrollableList({
    Key? key,
    required this.current,
    required this.changeCurrent,
    required this.items,
    required this.itemBuilder,
  }) : super(key: key);

  final T current;
  final void Function(int index) changeCurrent;
  final List<T> items;
  final Function(BuildContext, int) itemBuilder;

  @override
  createState() => _VerticalScrollableListState();
}

class _VerticalScrollableListState extends State<VerticalScrollableList> {
  var controller = PageController(
    viewportFraction: 1 / 6,
  );

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.items.length,
      onPageChanged: (int index) => widget.changeCurrent(index),
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          child: widget.itemBuilder(context, index),
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
