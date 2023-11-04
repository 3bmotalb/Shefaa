// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get_core/get_core.dart';
// // import 'package:get/get_navigation/get_navigation.dart';
// // import 'package:get_storage/get_storage.dart';
// // import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
// // import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
// // import 'package:graduation_project/DB/test3.dart';
// // import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/DB/Models/category.dart';

// // ignore: must_be_immutable
// class Test extends StatefulWidget {
//   Test({Key? key}) : super(key: key);
//   String? shopId;

//   @override
//   State<Test> createState() => _TestState();
// }

// getdata() async {
//   await FirebaseFirestore.instance
//       .collection('doctor')
//       .doc('Oq8eUiU9fxedYBIviQJHYJ7AZ9r1')
//       .get()
//       .then((value) => print(value.data()));
// }

// class _TestState extends State<Test> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getdata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     String? shopId;
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('category').snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData)
//               return Center(
//                 child: CircularProgressIndicator(),
//               );

//             return Container(
//               padding: EdgeInsets.only(bottom: 16.0),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                       flex: 1,
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(12.0, 10.0, 10.0, 10.0),
//                         child: Text(
//                           "Shop",
//                         ),
//                       )),
//                   Expanded(
//                     flex: 4,
//                     child: DropdownButton(
//                       value: shopId,
//                       isDense: true,
//                       onChanged: (valueSelectedByUser) {
//                         setState(() {
//                           shopId = valueSelectedByUser as String?;
//                           print(shopId);
//                         });
//                       },
//                       hint: Text('Choose shop'),
//                       items:
//                           snapshot.data!.docs.map((DocumentSnapshot? document) {
//                         CategoryModel category = CategoryModel.fromJson(
//                             document!.data() as Map<String, dynamic>,
//                             document.id);
//                         return DropdownMenuItem<String>(
//                           value: category.id,
//                           child: Text(category.nameen!),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }

// // class Test extends StatefulWidget {
// //   String uid;
// //   Test({required this.uid, Key? key}) : super(key: key);

// //   @override
// //   State<Test> createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   final _box = GetStorage();
// //   bool isloading = false;
// //   bool shownurse = false;
// //   var data;
// //   User? userloged;

// //   String name = "";
// //   String phonenumber = "";
// //   String imageurl = "";
// //   int gender = 0;

// //   CollectionReference nurseref = FirebaseFirestore.instance.collection('nurse');
// //   getdata() async {
// //     isloading = false;
// //     try {
// //       final userdoc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(widget.uid)
// //           .get();
// //       if (userdoc == null)
// //         return;
// //       else {
// //         setState(() {
// //           name = userdoc.get('first_name') + ' ' + userdoc.get('last_name');
// //           phonenumber = userdoc.get('phone1');
// //           imageurl = userdoc.get('imageurl');
// //           gender = userdoc.get('gender');
// //           isloading = true;
// //         });
// //       }
// //     } catch (e) {}
// //   }

// //   getcommentsss() async {
// //     var url = Uri.parse('https://fluttershefaa.000webhostapp.com/index.php');
// //     var data = {"userid": FirebaseAuth.instance.currentUser!.uid};
// //     var response = await http.post(url, body: data);
// //     var responsebody = jsonDecode(response.body);
// //     print(responsebody);
// //     return responsebody;
// //   }

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     getdata();
// //     getcommentsss();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var h = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //         appBar: AppBar(),
// //         body: isloading
// //             ? Center(
// //                 child: Column(
// //                 children: [
// //                   Container(
// //                     height: 100,
// //                     width: 100,
// //                     child: CircleAvatar(
// //                       radius: 10,
// //                       child: Image.network(imageurl),
// //                     ),
// //                   ),
// //                   Text("Hello user ${name}"),
// //                   Text("${phonenumber}"),
// //                   gender == 1 ? Text("Male") : Text("female"),
// //                   RaisedButton(onPressed: () async {
// //                      _box.write('login', false);
// //                       _box.remove('type');
// //                     await FirebaseAuth.instance.signOut();

// //                     Get.to(drawer(const MainHome()));
// //                   }),
// //                   Container(
// //                     height: 300,
// //                     child: FutureBuilder(
// //                         future: getcommentsss(),
// //                         builder: (context, AsyncSnapshot snapshot) {
// //                           if (snapshot.hasData) {
// //                             return ListView.builder(
// //                                 itemCount: snapshot.data.length,
// //                                 itemBuilder: (context, i) {
// //                                   return ListTile(
// //                                     title: Text('${snapshot.data[i]['email']}'),
// //                                     subtitle:
// //                                         Text('${snapshot.data[i]['comment']}'),
// //                                   );
// //                                 });
// //                           } else
// //                             return Center(
// //                               child: CircularProgressIndicator(),
// //                             );
// //                         }),
// //                   ),
// //                   RaisedButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         shownurse = !shownurse;
// //                       });
// //                     },
// //                     child: Text("Show all Nurse"),
// //                   ),
// //                   shownurse
// //                       ? Container(
// //                           height: 300,
// //                           child: FutureBuilder(
// //                             future: nurseref.get(),
// //                             builder: (context, AsyncSnapshot snapshot) {
// //                               if (snapshot.hasData) {
// //                                 return ListView.builder(
// //                                     itemCount: snapshot.data!.docs.length,
// //                                     itemBuilder: (context, i) {
// //                                       return GestureDetector(
// //                                         onTap: () {
// //                                           Get.to(Test3(
// //                                               nurseid: snapshot.data.docs[i]
// //                                                   ['userid'],
// //                                               first_name: snapshot.data.docs[i]
// //                                                   ['first_name'],
// //                                               lastname: snapshot.data.docs[i]
// //                                                   ['last_name'],
// //                                               imageurl: snapshot.data.docs[i]
// //                                                   ['image_url'],
// //                                               user_image: imageurl,
// //                                               user_name: name));
// //                                         },
// //                                         child: Card(
// //                                             child: Row(
// //                                           children: [
// //                                             Expanded(
// //                                               flex: 1,
// //                                               child: Image.network(
// //                                                 "${snapshot.data.docs[i]['image_url']}",
// //                                                 fit: BoxFit.fill,
// //                                                 height: 80,
// //                                               ),
// //                                             ),
// //                                             Expanded(
// //                                               flex: 3,
// //                                               child: ListTile(
// //                                                 title: Text(
// //                                                     "${snapshot.data.docs[i]['first_name']}"),
// //                                                 subtitle: Text(
// //                                                   "${snapshot.data.docs[i]['userid']}",
// //                                                   style:
// //                                                       TextStyle(fontSize: 14),
// //                                                 ),
// //                                               ),
// //                                             ),
// //                                           ],
// //                                         )),
// //                                       );
// //                                     });
// //                               } else {
// //                                 return Center(
// //                                   child: CircularProgressIndicator(),
// //                                 );
// //                               }
// //                             },
// //                           ),
// //                         )
// //                       : Container(),
// //                 ],
// //               ))
// //             : Center(
// //                 child: CircularProgressIndicator(),
// //               ));
// //   }
// // }
