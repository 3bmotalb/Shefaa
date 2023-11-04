// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Model/Chat/BubbleChat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/Model/Chat/message.dart';
import 'package:get/get.dart';
import '../../themes.dart';

class ChatPage extends StatefulWidget {
  String? chatid;
  ChatPage({Key? key, required this.chatid}) : super(key: key);
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance
        .collection('chat')
        .doc(widget.chatid!)
        .collection('messages');

    DocumentReference lastmessage =
        FirebaseFirestore.instance.collection('chat').doc(widget.chatid!);

    submitMsg(data) {
      lastmessage.update({'lastmessage': data, 'lasttime': DateTime.now()});
      messages.add(
        {
          kMessage: data,
          kCreatedAt: DateTime.now(),
          'senderid': FirebaseAuth.instance.currentUser!.uid,
          'receiverid': 'MfTPpU1mgacGpyjriFMYRpDSnBh1',
        },
      );
      controller.clear();
      _controller.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Get.back();
                },
              ),
              // automaticallyImplyLeading: false,
              backgroundColor: PrimaryColor,
              title: Text('_Chat'.tr),

              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].senderid ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? ChatBubble2(
                                message: messagesList[index],
                              )
                            : ChatBubble(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    cursorColor: DarkBlue,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: '_sendMessage'.tr,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: DarkBlue,
                        onPressed: () {
                          submitMsg(controller.text);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xFF324E7B),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: DarkBlue, width: 2)),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          // const Text('Loading...');
        }
      },
    );
  }
}
