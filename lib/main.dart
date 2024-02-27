
import 'package:flutter/material.dart';
import 'package:watchapp/clock_screen/clock_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ClockScreen(),
      },
    ),
  );
}
