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
              .expanded()
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
                        images: [
                          'https://images.immediate.co.uk/production/volatile/sites/4/2021/08/mountains-7ddde89.jpg',
                          'https://www.travelandleisure.com/thmb/ildFh_HcRHGYli6qL01ytKrVXkI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/grand-teton-rocky-mountains-USMNTNS0720-52499caea565471a8571acdfc3dfd9fe.jpg',
                          'https://th-thumbnailer.cdn-si-edu.com/_fo23UThzt2yYi8vrV0jcafbQ3Q=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25/f0/25f08cff-0355-4001-86ad-28950a866af4/grandteton.jpg',
                          'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?cs=srgb&dl=pexels-joyston-judah-933054.jpg&fm=jpg',
                          'https://images.immediate.co.uk/production/volatile/sites/4/2021/08/mountains-7ddde89.jpg',
                          'https://www.travelandleisure.com/thmb/ildFh_HcRHGYli6qL01ytKrVXkI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/grand-teton-rocky-mountains-USMNTNS0720-52499caea565471a8571acdfc3dfd9fe.jpg',
                          'https://th-thumbnailer.cdn-si-edu.com/_fo23UThzt2yYi8vrV0jcafbQ3Q=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25/f0/25f08cff-0355-4001-86ad-28950a866af4/grandteton.jpg',
                          'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?cs=srgb&dl=pexels-joyston-judah-933054.jpg&fm=jpg',
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
