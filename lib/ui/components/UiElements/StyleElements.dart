import 'package:flutter/material.dart';

class StyleElement {
  BoxDecoration boxCardAllEdges() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        spreadRadius: 0.2,
        blurRadius: 10,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ], color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(12.0)));
  }

  BoxDecoration boxCardBottomPresets() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        spreadRadius: 0.6,
        blurRadius: 0.6,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ], color: Colors.white, borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)));
  }
}
