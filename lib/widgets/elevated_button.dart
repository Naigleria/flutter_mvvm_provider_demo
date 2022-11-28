
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElevatedButtonIcon extends StatelessWidget {

  final Function() method;
  final Widget icon;
  final Widget label;
  ElevatedButtonIcon({required this.method, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(
      onPressed: this.method,
      icon: this.icon,
      label: this.label,
    );
  }
}