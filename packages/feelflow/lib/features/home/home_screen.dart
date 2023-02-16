import 'package:feelflow/features/home/calendar.dart';
import 'package:feelflow/features/home/likert_radio.dart';
import 'package:feelflow/models/mood/likert_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:helpers/helpers.dart';
import 'package:image_animated_grid/image_animated_grid.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = useState<LikertScaleValue>(LikertScaleValue.neutral);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Stack(
        children: [
          Container()
              .backgroundRadialGradient(
                colors: [
                  scaleColorsMap[value.value]!.withOpacity(0.1),
                  context.colors.background,
                ],
                center: const Alignment(-2.1, 0.0),
                radius: 0.9,
                animate: true,
              )
              .animate(const Duration(milliseconds: 300), Curves.easeInOut)
              .scale(y: 1.0, x: 1.1)
              .translate(offset: const Offset(0, 30)),
          Column(
            children: [
              const Calendar().padding(bottom: 20),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LikertRadio(value: value).padding(left: 10, right: 20),
                  Column(
                    children: [
                      const ImageAnimatedGrid(
                        fullScreenTitle: 'Day name',
                        images: [
                          'https://images.immediate.co.uk/production/volatile/sites/4/2021/08/mountains-7ddde89.jpg',
                          'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                          'https://i.natgeofe.com/k/830b5d15-92db-429f-a80a-cc89b5700af5/mt-everest.jpg?w=636&h=437',
                          'https://ychef.files.bbci.co.uk/976x549/p0973kxy.jpg',
                          'https://static.theprint.in/wp-content/uploads/2020/12/everest.jpg',
                          'https://upload.wikimedia.org/wikipedia/commons/5/5c/Mount_Everest%2C_Nepal%2C_Himalayas.jpg',
                          'https://www.americanexpress.com/de-de/amexcited/media/cache/default/cms/2022/01/Mount-Everest-besteigen-Titelbild-scaled.jpg',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmtpkKL7b7HSCGDgOihbaLwDu16KeoHH2YuxeOuyqlI_Z6g0-PARtGZC3qXUtspcRfuk&usqp=CAU',
                          'https://www.glorioushimalaya.com/wp-content/uploads/2020/03/Mount_Everest-1600x613-2.jpg',
                          'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?cs=srgb&dl=pexels-joyston-judah-933054.jpg&fm=jpg',
                        ],
                      ).width(double.infinity).height(250).clipRRect(all: 10),
                      const SizedBox(height: 10),
                      const TextField(
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your thoughts...',
                        ),
                      ).padding(bottom: 10),
                      const TextField(
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your thoughts...',
                        ),
                      ).padding(bottom: 10),
                      const TextField(
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your thoughts...',
                        ),
                      ).padding(bottom: 10),
                    ],
                  ).center().expanded()
                ],
              ),
              const Spacer(),
            ],
          ).padding(horizontal: 10),
        ],
      ),
    );
  }
}
