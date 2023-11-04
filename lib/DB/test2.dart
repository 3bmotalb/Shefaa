// // ignore_for_file: prefer_const_constructors
// // ignore: curly_braces_in_flow_control_structures
// // ignore: curly_braces_in_flow_control_structures

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
// import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
// import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
// import 'package:graduation_project/DB/test3.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Test2 extends StatefulWidget {
//   String uid;
//   Test2({required this.uid, Key? key}) : super(key: key);

//   @override
//   State<Test2> createState() => _Test2State();
// }

// class _Test2State extends State<Test2> {
//   final _box = GetStorage();
//   bool isloading = false;
//   var data;
//   var result;
//   NurseModel? nurse;
//   getdata() async {
//     await FirebaseFirestore.instance
//         .collection('nurse')
//         .doc(widget.uid)
//         .get()
//         .then((DocumentSnapshot) {
//       data = DocumentSnapshot;
//       nurse = NurseModel.fromJson(data.data());
//       print(nurse!.firstName);
//     });
//     setState(() {
//       isloading = true;
//     });
//   }

//   Future<List<dynamic>?> getCollection(CollectionReference collection) async {
//     try {
//       QuerySnapshot snapshot = await collection.get();
//       List<dynamic> result = snapshot.docs.map((doc) => doc.data()).toList();
//       // print(result);
//       return result;
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   getcomments() async {
//     var list;
//     try {
//       final comments = await FirebaseFirestore.instance
//           .collection('nurse')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('comments')
//           .get();

//       for (var comment in comments.docs) {
//         print("////////////////////");
//         print(comment.data());
//         print("////////////////////////");

//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(comment.get('userid'))
//             .get()
//             .then((DocumentSnapshot) {
//           print("////////////userdata////////////");

//           print(DocumentSnapshot.data());
//           print("////////////////////////");
//           var commentlist = comment.data();
//         });
//       }
//     } catch (e) {}
//   }

//   CollectionReference commentref = FirebaseFirestore.instance
//       .collection("nurse")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('comments');

//   getcommentsss() async {
//     var url = Uri.parse('http://192.168.1.14/shefaa/index.php');
//     var data = {"userid": "1"};
//     var response = await http.post(url, body: data);
//     var responsebody = jsonDecode(response.body);
//     print(responsebody);
//     return responsebody;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getdata();
//   }

//   getuser(String uid) async {
//     var userdata;
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .get()
//         .then((DocumentSnapshot) {
//       userdata = DocumentSnapshot.data();
//     });

//     return userdata;
//   }

//   @override
//   Widget build(BuildContext context) {
//     //all data of user store in List (data)
//     var h = MediaQuery.of(context).size.height;
//     return Scaffold(
//         appBar: AppBar(),
//         body: isloading
//             ? SingleChildScrollView(
//                 child: Center(
//                     child: Column(
//                   children: [
//                     Text("Hello nurse ${nurse!.firstName} "),
//                     Text("${_box.read('type')}"),
//                     RaisedButton(onPressed: () async {
//                       _box.write('login', false);
//                       _box.remove('type');
//                       await FirebaseAuth.instance.signOut();

//                       Get.to(drawer(const MainHome()));
//                     }),
//                     Container(
//                       height: 300,

//                       // child: StreamBuilder(
//                       //   stream: commentref.snapshots(),
//                       //   builder: (context, AsyncSnapshot snapshot) {
//                       //     if (snapshot.hasData) {
//                       //       return ListView.builder(
//                       //           itemCount: snapshot.data!.docs.length,
//                       //           itemBuilder: (context, i) {
//                       //             var user =
//                       //                 getuser(snapshot.data!.docs[i]['userid']);
//                       //             print(user);
//                       //             return GestureDetector(
//                       //               onTap: () {
//                       //                 // Get.to(Test3(
//                       //                 //     nurseid: snapshot.data.docs[i]
//                       //                 //         ['userid']));
//                       //               },
//                       //               child: Card(
//                       //   child: Row(
//                       // children: [
//                       //   Expanded(
//                       //     flex: 1,
//                       //     child: Image.network(
//                       //       "${snapshot.data.docs[i]['user_image']}",
//                       //       fit: BoxFit.fill,
//                       //       height: 80,
//                       //     ),
//                       //   ),
//                       //   Expanded(
//                       //     flex: 3,
//                       //     child: ListTile(
//                       //       title: Row(
//                       //         mainAxisAlignment:
//                       //             MainAxisAlignment
//                       //                 .spaceBetween,
//                       //         children: [
//                       //           Text(
//                       //               "${snapshot.data.docs[i]['comment']}"),
//                       //           Text(snapshot
//                       //               .data.docs[i]['rate']
//                       //               .toString()),
//                       //         ],
//                       //       ),
//                       //       subtitle: Text(
//                       //         "${snapshot.data.docs[i]['user_name']}",
//                       //         style: TextStyle(fontSize: 14),
//                       //       ),
//                       //                     ),
//                       //                   ),
//                       //                 ],
//                       //               )),
//                       //             );
//                       //           });
//                       //     } else {
//                       //       return Center(
//                       //         child: CircularProgressIndicator(),
//                       //       );
//                       //     }
//                       //   },
//                       // ),
//                     ),
//                   ],
//                 )),
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ));
//   }
// }
