// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_Chat/chat.dart';
import 'package:graduation_project/DB/functions.dart';
import 'package:graduation_project/Screens/UI_Chat/ChatPage.dart';
import 'package:intl/intl.dart';

class ModelChat extends StatefulWidget {
  ChatModel chat;
  var store;
  ModelChat({Key? key, required this.chat, required this.store})
      : super(key: key);

  @override
  State<ModelChat> createState() => _ModelChatState();
}

class _ModelChatState extends State<ModelChat> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.store.image),
      ),
      title: Text(
        "${widget.store.firstName} ${widget.store.lastName}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("${widget.chat.lastmessage}",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(
          functions().replaceFarsiNumber(
              DateFormat.jm().format(widget.chat.time!.toDate())),
          style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        Get.to(ChatPage(
          chatid: widget.chat.chatid,
        ));
      },
    );
  }
}
