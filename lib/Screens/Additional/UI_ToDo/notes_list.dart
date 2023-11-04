import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/Additional/UI_ToDo/my_note.dart';

import '../../../Controlers/C_toDo/ToDocontroller.dart';
import '../../../themes.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final NoteController nc = Get.put(NoteController());
    Widget getNoteList(){
      return Obx(
            () =>  nc.notes.isEmpty?Center(child: Image.asset('assets/images/emptylist.jpeg'),):
            ListView.builder(
                itemCount: nc.notes.length,
                itemBuilder: (context, index)=>
                    Card(
                      child: ListTile(
                          title: Text(nc.notes[index].title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500)),
                          leading: Text(
                            (index + 1).toString() + ".",
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: Wrap(children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.create),
                                onPressed: () =>
                                    Get.to(MyNote(index: index))),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: '_deleteNote'.tr,
                                      middleText: nc.notes[index].title!,
                                      buttonColor:const Color(0xFF29435c).withOpacity(.8),
                                        cancelTextColor:const Color(0xFF29435c).withOpacity(.8),
                                      onCancel: () => Get.back(),
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        nc.notes.removeAt(index);
                                        Get.back();
                                      });
                                })
                          ])),
                    )
            ),
      );
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,

            appBar: AppBar(
              backgroundColor: PrimaryColor,

              centerTitle: true,
              title:  Text('_toDo'.tr),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: PrimaryColor,
              child: const Icon(Icons.add),
              onPressed: () {
                Get.to(MyNote());
              },
            ),
            body: Padding(
                padding: const EdgeInsets.all(5),
                child:getNoteList())));
  }

}
