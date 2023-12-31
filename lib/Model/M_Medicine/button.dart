import 'package:flutter/material.dart';
import 'package:graduation_project/themes.dart';

class Button extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Button({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DarkBlue,
        ),
        child: Center(
          child: Text(
            label,
            style: ButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
