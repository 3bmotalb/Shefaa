import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_Chat/ChatPage.dart';
import 'package:intl/intl.dart';

import '../local/locale_controller.dart';

// ignore: non_constant_identifier_names

check_chat(String chatid) async {
  if (await FirebaseFirestore.instance
      .collection('chat')
      .doc(chatid)
      .get()
      .then((value) => value.exists)) {
    return true;
  } else {
    return false;
  }
}

// ignore: non_constant_identifier_names
create_chat(String chatid, String userid, String nurseid) async {
  List users = [
    userid,
    nurseid,
  ];
  await FirebaseFirestore.instance.collection('chat').doc(chatid).set({
    'users': FieldValue.arrayUnion(users),
    'chatid': chatid,
    'lastmessage': '',
    'lasttime': DateTime.now(),
  });
  Get.to(ChatPage(
    chatid: chatid,
  ));
}

class functions {
  MylocaleController locale = Get.put(MylocaleController());

  Change_Date_Format(Timestamp date) {
    var formatter = DateFormat.yMMMMd(locale.initiallocale.languageCode);
    String formatted = formatter.format(date.toDate());
    return formatted;
  }

  Change_Time_Format(Timestamp date) {
    var formatter = DateFormat.jm(locale.initiallocale.languageCode);
    String formatted = formatter.format(date.toDate());
    return formatted;
  }

  String replaceFarsiNumber(String input) {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'PM',
      'AM'
    ];
    const arabic = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
      'م',
      'ًًص'
    ];

    for (int i = 0; i < english.length; i++) {
      locale.initiallocale.languageCode == 'ar'
          ? input = input.replaceAll(english[i], arabic[i])
          : input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }

  String time_to_ar(String input) {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'AM',
      'PM'
    ];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', 'ص', 'م'];

    for (int i = 0; i < english.length; i++) {
      locale.initiallocale.languageCode == 'ar'
          ? input = input.replaceAll(english[i], arabic[i])
          : input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }
}
