import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes.dart';

int? groupValue;

class SignRadioBtn extends StatefulWidget {
  const SignRadioBtn({Key? key}) : super(key: key);

  @override
  State<SignRadioBtn> createState() => _SignRadioBtnState();
}

class _SignRadioBtnState extends State<SignRadioBtn> {
  

  ValueChanged<int?> _valueChangedHandler() {
    return (value) => setState(() => groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyRadioOption<int>(
          value: 1,
          groupValue: groupValue,
          onChanged: _valueChangedHandler(),
          text: '_female'.tr,
        ),
        SizedBox(
          width: w * .1,
        ),
        MyRadioOption<int>(
          value: 2,
          groupValue: groupValue,
          onChanged: _valueChangedHandler(),
          text: '_male'.tr,
        ),
      ],
    );
  }
}

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

   const MyRadioOption({Key? key,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.teal.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                width: w * .04,
                height: h * .025,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  color: isSelected ? Blue : Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
