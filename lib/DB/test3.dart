
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:csc_picker/csc_picker.dart';

// class Test3 extends StatefulWidget {
//   const Test3({Key? key}) : super(key: key);

//   @override
//   State<Test3> createState() => _Test3State();
// }

// class _Test3State extends State<Test3> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: CSCPicker(
//         defaultCountry: DefaultCountry.Egypt,
//         disableCountry: true,
        
        
//         onStateChanged: (value) {
//           setState(() {
//             var stateValue = value;
//             print(value);
//           });
//         },
//         onCityChanged: (value) {
//           setState(() {
//             var cityValue = value;
//             print(value);
//           });
//         },
//       ),
//     );
//   }
// }

// // class Test3 extends StatefulWidget {
// //   String nurseid;
// //   String first_name;
// //   String lastname;
// //   String imageurl;
// //   String user_name;
// //   String user_image;

// //   Test3(
// //       {required this.nurseid,
// //       required this.first_name,
// //       required this.lastname,
// //       required this.imageurl,
// //       required this.user_name,
// //       required this.user_image,
// //       Key? key})
// //       : super(key: key);

// //   @override
// //   State<Test3> createState() => _Test3State();
// // }

// // class _Test3State extends State<Test3> {
// //   sendRequesttofb() async {
// //     try {
// //       DocumentReference reference =
// //           await FirebaseFirestore.instance.collection('request').add({
// //         'userid': FirebaseAuth.instance.currentUser!.uid,
// //         'nurseid': widget.nurseid,
// //         'day': 'monday',
// //         'time': "4:30",
// //         'user_name': widget.user_name,
// //         'user_image': widget.user_image
// //       });
// //       print(reference);
// //       Get.back();
// //       return reference;
// //     } catch (e) {
// //       print(e.toString());
// //     }
// //   }

// //   TextEditingController CommentController = TextEditingController();
// //   TextEditingController RateController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();

// //   sendcommenttofb(String Comment, int rate) async {
// //     try {
// //       DocumentReference ref = await FirebaseFirestore.instance
// //           .collection('nurse')
// //           .doc(widget.nurseid)
// //           .collection('comments')
// //           .add({
// //         'userid': FirebaseAuth.instance.currentUser!.uid,
// //         'comment': Comment,
// //         'rate': rate,
// //         'user_name': widget.user_name,
// //         'user_image': widget.user_image,
// //       });
// //       Get.back();
// //       return ref;
// //     } catch (e) {
// //       print(e.toString());
// //     }
// //   }

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     print(widget.user_name);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: SingleChildScrollView(
// //         child: Center(
// //             child: Column(
// //           children: [
// //             Container(
// //               height: 200,
// //               width: 200,
// //               child: Image.network(widget.imageurl),
// //             ),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             Text(widget.first_name),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             Text(widget.lastname),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             RaisedButton(
// //               onPressed: () async {
// //                 loading(context);
// //                 DocumentReference status = await sendRequesttofb();
// //                 print("///////////////////////////////");
// //                 if (status != null) {
// //                 } else
// //                   print("empty");
// //               },
// //               child: Text("Request"),
// //             ),
// //             Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   children: [
// //                     TextFormField(controller: CommentController),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     TextFormField(
// //                       controller: RateController,
// //                       keyboardType: TextInputType.number,
// //                       maxLength: 1,
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     GestureDetector(
// //                         onTap: () async {
// //                           loading(context);
// //                           _formKey.currentState!.save();
// //                           print(CommentController.text);
// //                           print(RateController.text);
// //                           int rate = int.parse(RateController.text);
// //                           var status = await sendcommenttofb(
// //                               CommentController.text, rate);
// //                           if (status != null) {
// //                             print("Insert comment");
// //                             CommentController.text = "";
// //                             RateController.text = "";
// //                           } else
// //                             print("comment failed");
// //                         },
// //                         child: Container(
// //                             padding: EdgeInsets.all(10),
// //                             color: Colors.amber,
// //                             child: Text("Send Comment"))),
// //                   ],
// //                 ))
// //           ],
// //         )),
// //       ),
// //     );
// //   }
// // }
