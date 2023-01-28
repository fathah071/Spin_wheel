import 'dart:math';

import '../utilities/spiningWheeldata.dart';

int? randomIndex;
int randm() {
  return randomIndex = Random().nextInt(items.length);
}