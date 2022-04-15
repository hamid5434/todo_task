import 'package:flutter/material.dart';
import 'package:todo_task/common/theme.dart';
import 'package:todo_task/home/widgets/checkbox_shape.dart';

class PriorityCheckBox extends StatelessWidget {
  const PriorityCheckBox({
    Key? key,
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTab,
  }) : super(key: key);
  final String label;
  final Color color;
  final bool isSelected;
  final GestureTapCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 2,
            color: secondaryTextColor.withOpacity(.5),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 0,
              top: 0,
              child: Center(
                child: CheckBoxShape(
                  color: color,
                  isSelected: isSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
