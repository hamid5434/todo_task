import 'package:flutter/material.dart';

class CheckBoxShape extends StatelessWidget {
  const CheckBoxShape({Key? key, required this.color, required this.isSelected})
      : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isSelected
          ? Icon(
        Icons.check,
        color: Theme.of(context).colorScheme.surface,
        size: 19,
      )
          : null,
    );
  }
}