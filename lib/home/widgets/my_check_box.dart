import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/common/theme.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({Key? key, required this.value}) : super(key: key);

  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: value ? null : Border.all(color: secondaryTextColor, width: 1),
        color: value ? primeryColor : null,
      ),
      child: value
          ? Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 22,
            )
          : null,
    );
  }
}
