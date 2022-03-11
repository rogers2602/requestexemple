import 'dart:math';

import 'package:flutter/material.dart';

class ColorsRandom {
  static List<Color> dataList = [
    Colors.blue,
    Colors.blueGrey,
    Colors.blueAccent.shade700,
    Colors.lightBlue,
    Colors.yellow.shade600,
    Colors.yellowAccent.shade700,
    Colors.black,
    Colors.blueGrey,
    Colors.grey,
    Colors.teal,
    Colors.tealAccent.shade700,
    Colors.redAccent.shade700,
    Colors.red,
    Colors.purpleAccent.shade700,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepPurpleAccent.shade700,
    Colors.green,
    Colors.greenAccent.shade700,
    Colors.lightGreen,
    Colors.lightGreenAccent.shade700,
    Colors.orange,
    Colors.deepOrange,
    Colors.deepOrangeAccent.shade700,
    Colors.orangeAccent.shade700,
    Colors.indigo,
    Colors.indigoAccent.shade700,
  ];

  static Color colorRandom() {
    return dataList[Random().nextInt(26)];
  }
}
