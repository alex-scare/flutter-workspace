import 'package:flavourites/features/home/horizontal_scrollable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = useState(0);
    var categories = useRef([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

    return Scaffold(
      body: HorizontalScrollableList<int>(
        items: categories.value,
        current: category.value,
        changeCurrent: (index) {
          category.value = categories.value[index];
        },
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
    );
  }
}
