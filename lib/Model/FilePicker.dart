// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'package:graduation_project/Model/Home/Buttons.dart';

class FilePic extends StatefulWidget {
  const FilePic({Key? key}) : super(key: key);

  @override
  State<FilePic> createState() => FilePicState();
}

class FilePicState extends State<FilePic> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    var fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Container(
        padding: const EdgeInsets.all(32),
        child: Center(
            child: GestureDetector(
                child: const Icon(Icons.camera),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Buttons(
                                '_selectFile'.tr,
                                0xFF2C3333,
                                () {
                                  selectFile();
                                },
                                const Icon(Icons.attach_file),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                fileName,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 48),
                              Buttons(
                                '_uploadFile',
                                0xFF2C3333,
                                () {
                                  uploadFile();
                                },
                                const Icon(Icons.cloud_upload_outlined),
                              ),
                              const SizedBox(height: 20),
                              task != null
                                  ? buildUploadStatus(task!)
                                  : Container(),
                            ],
                          ));
                })));
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'cvs/nurses/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    // print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException {
      return null;
    }
  }
}
