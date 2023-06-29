import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/constants.dart';
import 'package:gt_food/model.dart';

class MenuIcon extends StatelessWidget {
  ClassName iconType;

  final _scale = 6.3;
  final HashMap<ClassName, List<dynamic>> _iconMap = HashMap.from({
    ClassName.WHEAT_ICON: [
      const Size(16.89, 36),
      const Alignment(0.8813214906099438 * 2 - 1, 0.8678494623655914 * 2 - 1)
    ],
    ClassName.CHICKEN_ICON: [
      const Size(33.23, 36),
      const Alignment(0.8680957163140216 * 2 - 1, 0.12903225806451612 * 2 - 1)
    ],
    ClassName.CEREALS_W_GLUTEN_ICON: [
      const Size(39.41, 36),
      const Alignment(0.7464524576241196 * 2 - 1, 0.25741935483870964 * 2 - 1)
    ],
    ClassName.HALAL_ICON: [
      const Size(36, 36),
      const Alignment(0.6293706293706294 * 2 - 1, 0.8678494623655914 * 2 - 1)
    ],
    ClassName.VEGAN_ICON: [
      const Size(49.47, 36),
      const Alignment(0.4128352841888967 * 2 - 1, 0.12627240143369175 * 2 - 1)
    ],
    ClassName.GLUTEN_FREE_ICON: [
      const Size(44.74, 36),
      const Alignment(0 * 2 - 1, 0.48075268817204304 * 2 - 1)
    ],
    ClassName.MILK_ICON: [
      const Size(19.79, 36),
      const Alignment(0.8294894278812747 * 2 - 1, 0.25806451612903224 * 2 - 1)
    ],
    ClassName.EGG_ICON: [
      const Size(27.76, 36),
      const Alignment(0.6262574768896139 * 2 - 1, 0.9968817204301075 * 2 - 1)
    ],
    ClassName.SOY_ICON: [
      const Size(24.86, 36),
      const Alignment(0.961937134010904 * 2 - 1, 0.6451612903225806 * 2 - 1)
    ],
    ClassName.VEGETARIAN_ICON: [
      const Size(36.52, 36),
      const Alignment(0.3910256410256411 * 2 - 1, 0.7388172043010752 * 2 - 1)
    ],
    ClassName.BEEF_ICON: [
      const Size(42.59, 36),
      const Alignment(0.3197809670376866 * 2 - 1, 0.48075268817204304 * 2 - 1)
    ],
    ClassName.SESAME_ICON: [
      const Size(39.95, 36),
      const Alignment(0.5753235241978373 * 2 - 1, 0.6097849462365591 * 2 - 1)
    ],
    ClassName.TREE_NUTS_ICON: [
      const Size(32.52, 36),
      const Alignment(0.3575721984247616 * 2 - 1, 0.9968817204301075 * 2 - 1)
    ],
    ClassName.PORK_ICON: [
      const Size(44.61, 36),
      const Alignment(0.161289159666895 * 2 - 1, 0.48075268817204304 * 2 - 1)
    ],
    ClassName.TURKEY_ICON: [
      const Size(38.63, 36),
      const Alignment(0.744397783816212 * 2 - 1, 0.5154838709677419 * 2 - 1)
    ],
    ClassName.FISH_ICON: [
      const Size(32.02, 36),
      const Alignment(0.8644734119594455 * 2 - 1, 0.3870967741935484 * 2 - 1)
    ],
    ClassName.SHELLFISH_ICON: [
      const Size(37.54, 36),
      const Alignment(0.60947057582788446 * 2 - 1, 0.48075268817204304 * 2 - 1)
    ],
    ClassName.GRAIN_GROUP: [
      const Size(39.41, 36),
      const Alignment(0.7464524576241196 * 2 - 1, 0.12838709677419354 * 2 - 1)
    ]
  });

  MenuIcon(this.iconType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/icons.png',
          width: (_iconMap[iconType]![0] as Size).width,
          height: (_iconMap[iconType]![0] as Size).height,
          alignment: _iconMap[iconType]![1] as Alignment,
          fit: BoxFit.none,
          scale: _scale);
  }
}
