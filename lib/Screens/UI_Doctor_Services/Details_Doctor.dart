// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/DB/Models/M_request/request.dart';
// import 'package:graduation_project/DB/Models/M_request/requestcontroller.dart';
// import 'package:graduation_project/DB/Models/M_request/requesttest.dart';
// import 'package:graduation_project/DB/Models/M_user/user.dart';
// import 'package:graduation_project/Screens/UI_Nurse_Service/Homepage-nurse.dart';
// import 'package:graduation_project/Screens/UI_Nurse_Service/Requests.dart';
// import 'package:graduation_project/Screens/UI_User_Service/screens/user_homepage.dart';
// import 'package:intl/intl.dart';

// // ignore: must_be_immutable
// class Details2_d extends StatefulWidget {
//   RequestTest request;
//   Details({Key? key, required this.request}) : super(key: key);

//   @override
//   State<Details> createState() => _DetailsState();
// }

// class _DetailsState extends State<Details2_d> {
//   RequestController requestcontroller = Get.put(RequestController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 156, 191, 219),
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           "Details",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(children: [
//           Image.network(
//             widget.request.UserStore!.image!,
//             height: 100,
//             width: 100,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//               widget.request.UserStore!.firstName! +
//                   ' ' +
//                   widget.request.UserStore!.lastName!,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.home),
//               Text(
//                   "Home:${widget.request.UserStore!.city} - ${widget.request.UserStore!.government}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.email),
//               Text("Email: ${widget.request.UserStore!.email}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.phone),
//               Text("Phone: ${widget.request.UserStore!.phone1}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.timer_outlined),
//               Text(
//                   "Date: ${DateFormat('dd-MM-yyyy').format(widget.request.app!.date!.toDate())}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.timer_outlined),
//               Text("Time: ${widget.request.app!.time}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               const Icon(Icons.timer_outlined),
//               Text("status: ${widget.request.status}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ))
//             ],
//           ),
//           const SizedBox(height: 20),
//           widget.request.status == 'pending'
//               ? Container(
//                   height: 40,
//                   width: 100,
//                   color: Colors.green,
//                   child: TextButton(
//                     onPressed: () async {
//                       await acceptrequest(widget.request.id,
//                           widget.request.nurseid, widget.request.appid);
//                       Get.offAll(HomePage2());
//                     },
//                     child: const Text("Confirm",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 )
//               : Container(
//                   height: 40,
//                   width: 100,
//                   color: Colors.green,
//                   child: TextButton(
//                     onPressed: () async {},
//                     child: const Text("Finish",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 ),
//           const SizedBox(height: 20),
//           Container(
//             height: 40,
//             width: 100,
//             color: Colors.red,
//             child: TextButton(
//                 onPressed: () async {
//                   await deleterequest(
//                     widget.request.id,
//                   );
//                   Get.offAll(HomePage2());
//                 },
//                 child: const Text("Delete",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ))),
//           ),
//         ]),
//       ),
//     );
//   }

//   acceptrequest(String? id, String? nurseid, String? appid) async {
//     await FirebaseFirestore.instance.collection('request').doc(id).update({
//       'status': 'accepted',
//     });
//     await FirebaseFirestore.instance
//         .collection('nurse')
//         .doc(nurseid)
//         .collection('appointment')
//         .doc(appid)
//         .update({
//       'booked': true,
//     });
//     Get.snackbar(
//       'Success',
//       'Request Accepted',
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }

//   deleterequest(String? id) async {
//     await FirebaseFirestore.instance.collection('request').doc(id).delete();
//     Get.snackbar(
//       'Success',
//       'Request Deleted',
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }
