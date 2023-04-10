import 'package:flutter/material.dart';

class Utils {
  double timeOfDayToDouble(TimeOfDay myTime) =>
      myTime.hour + myTime.minute / 60.0;
}
