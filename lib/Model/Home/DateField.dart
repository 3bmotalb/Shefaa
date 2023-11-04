// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';

final format = DateFormat("yyyy-MM-dd");

// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       OutlinedButton(
//         onPressed: () {},
//         child: Text(
//           'Basic date field (${format.pattern})',
//         ),
//       ),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) {
//           return showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));
//         },
//       ),
//     ]);
//   }
// }

Widget Datepicker({required Function(DateTime time) onsaved}) => SizedBox(
      height: 200,
      child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime(1990, 1, 1),
          maximumYear: 2022,
          minimumYear: 1900,
          onDateTimeChanged: onsaved),
    );
