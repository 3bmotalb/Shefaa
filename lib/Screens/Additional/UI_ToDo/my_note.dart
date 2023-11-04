// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/themes.dart';

import '../../../Controlers/C_toDo/ToDocontroller.dart';
import '../../../Model/AdditionalModel/M_ToDo/ToDomodel.dart';

class MyNote extends StatelessWidget {
  int ?index;
  MyNote({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final NoteController nc = Get.find();
    String text="";
    text=(index==null?" ":nc.notes[index!].title)!;
    TextEditingController textEditingController =  TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,


            appBar: AppBar(
              backgroundColor:PrimaryColor ,
              title: index==null? Text('_createNote'.tr): Text('_updateNote'.tr),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height:h*.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            hintText: '_createNote'.tr,
                            labelText: '_myNote'.tr,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(10)),
                        ),
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height:h*.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('_cancel'.tr),
            style:  ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                      (states) =>
                      const Color(0xFFB20600).withOpacity(.8)),)
        ),
                        ElevatedButton(
                            onPressed: () {
                              if (index==null){
                              nc.notes.add(Note(title: textEditingController.text));
                              }
                              else{
                             var updatenote=nc.notes[index!];
                             updatenote.title=textEditingController.text;
                             nc.notes[index!]=updatenote;
                              }

                              Get.back();
                            },
                          child: index==null? Text('_add'.tr): Text('_update'.tr),
                            style:
                            ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                      const Color(0xFF6BCB77).withOpacity(.8)),)

                        )
                    ])
                  ],
                ),
              ),
            )));
  }
}
