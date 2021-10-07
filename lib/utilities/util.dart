import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  //SmF2YSDQvdC1INGC0L7RgNC80L7Qt9C40YIhCg==
  static String formatRequestDate(DateTime time) {
    return DateFormat("EEEE d  MMM y").format(time);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.indigo,
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$value",
          style: const TextStyle(fontSize: 20, color: Colors.indigo),
        ),  const SizedBox(
          height: 10,
        ),
        Text(
          units,
          style: const TextStyle(fontSize: 15, color: Colors.indigo),
        ),
      ],
    );
  }
}
