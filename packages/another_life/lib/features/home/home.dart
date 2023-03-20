import 'package:another_life/features/home/vertical_scrollable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = useState(0);
    var categories = useRef([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 160,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ),
            VerticalScrollableList(
              items: categories.value,
              current: category.value,
              changeCurrent: (index) {
                category.value = categories.value[index];
              },
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Styled.text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: category.value == index ? 25 : 16,
                      ),
                      animate: true,
                    ).animate(
                      const Duration(milliseconds: 200),
                      Curves.easeIn,
                    ),
                    const SizedBox(width: 10),
                    Styled.text(
                      'Blabla',
                      style: TextStyle(
                        fontSize: category.value == index ? 25 : 16,
                      ),
                      animate: true,
                    ).animate(
                      const Duration(milliseconds: 200),
                      Curves.easeIn,
                    ),
                  ],
                )
                    .padding(
                        left: category.value == index
                            ? 16
                            : category.value == index + 1
                                ? 8
                                : category.value == index - 1
                                    ? 8
                                    : 0,
                        animate: true)
                    .animate(
                      const Duration(milliseconds: 200),
                      Curves.easeIn,
                    );
              },
            ).padding(horizontal: 16),
          ],
        ).height(400),
      ),
    );
  }
}
