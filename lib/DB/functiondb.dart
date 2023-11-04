
//get data of one user and store it in list 'data'
//  getdata() async {
//     await FirebaseFirestore.instance
//         .collection('nurse')
//         .doc(widget.uid)
//         .get()
//         .then((DocumentSnapshot) {
//       data = DocumentSnapshot;
//     });
//     setState(() {
//       isloading = true;
//     });
//   }
//////////////////////////////////////////////////////


//get all nurses in collection and store its dara in form json  
// Future<List<dynamic>?> getCollection(CollectionReference collection) async {
//     try {
//       QuerySnapshot snapshot = await collection.get();
//       List<dynamic> result = snapshot.docs.map((doc) => doc.data()).toList();
//       print(result);
//       return result;
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }
///////////////////////////////////////////////////////

// get all nurses and show it by future builder 
//if has data show it in listview builder 
//if not return circul
// CollectionReference nurseref = FirebaseFirestore.instance.collection("nurse");
// FutureBuilder(
//                         future: nurseref.get(),
//                         builder: (context, AsyncSnapshot snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                                 itemCount: snapshot.data!.docs.length,
//                                 itemBuilder: (context, i) {
//                                   return Card(
//                                       child: Row(
//                                     children: [
//                                       Expanded(
//                                         flex: 1,
//                                         child: Image.network(
//                                           "${snapshot.data.docs[i]['image_url']}",
//                                           fit: BoxFit.fill,
//                                           height: 80,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         flex: 3,
//                                         child: ListTile(
//                                           title: Text(
//                                               "${snapshot.data.docs[i]['first_name']}"),
//                                           subtitle: Text(
//                                             "${snapshot.data.docs[i]['userid']}",
//                                             style: TextStyle(fontSize: 14),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ));
//                                 });
//                           } else {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),

//////////////////////////////////////////////////
//send request to fb

// sendRequesttofb() async {
//     try {
//       DocumentReference reference =
//           await FirebaseFirestore.instance.collection('request').add({
//         'userid': FirebaseAuth.instance.currentUser!.uid,
//         'nurseid': widget.nurseid,
//         'day': 'monday',
//         'time': "4:30",
//       });
//       print(reference);
//       Get.back();
//       return reference;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//////////////////////////////////////////////////
//return request for specific nurse

// Query<Map<String, dynamic>> requestref = FirebaseFirestore.instance
//       .collection("request")
//       .where('nurseid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

//       FutureBuilder(
//                         future: requestref.get(),
//                         builder: (context, AsyncSnapshot snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                                 itemCount: snapshot.data!.docs.length,
//                                 itemBuilder: (context, i) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       // Get.to(Test3(
//                                       //     nurseid: snapshot.data.docs[i]
//                                       //         ['userid']));
//                                     },
//                                     child: Card(
//                                         child: Row(
//                                       children: [
//                                         // Expanded(
//                                         //   flex: 1,
//                                         //   child: Image.network(
//                                         //     "${snapshot.data.docs[i]['image_url']}",
//                                         //     fit: BoxFit.fill,
//                                         //     height: 80,
//                                         //   ),
//                                         // ),
//                                         Expanded(
//                                           flex: 3,
//                                           child: ListTile(
//                                             title: Text(
//                                                 "${snapshot.data.docs[i]['nurseid']}"),
//                                             subtitle: Text(
//                                               "${snapshot.data.docs[i]['userid']}",
//                                               style: TextStyle(fontSize: 14),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                   );
//                                 });
//                           } else {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),









// sendcommenttofb(String Comment, int rate) async {
//     try {
//       DocumentReference ref = await FirebaseFirestore.instance
//           .collection('nurse')
//           .doc(widget.nurseid)
//           .collection('comments')
//           .add({
//         'userid': FirebaseAuth.instance.currentUser!.uid,
//         'comment': Comment,
//         'rate': rate
//       });
//       Get.back();
//       return ref;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//  GestureDetector(
//                         onTap: () async {
//                           loading(context);
//                           _formKey.currentState!.save();
//                           print(CommentController.text);
//                           print(RateController.text);
//                           int rate = int.parse(RateController.text);
//                           var status = await sendcommenttofb(
//                               CommentController.text, rate);
//                           if (status != null) {
//                             print("Insert comment");
//                             CommentController.text = "";
//                             RateController.text = "";
//                           } else
//                             print("comment failed");
//                         },
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             color: Colors.amber,
//                             child: Text("Send Comment"))),








// imgpicker(BuildContext context, String txt, File? image, String type) {
  //   double h = MediaQuery.of(context).size.height;
  //   double w = MediaQuery.of(context).size.width;

  //   return Container(
  //     padding: EdgeInsets.only(top: h * .01),
  //     height: h * .25,
  //     width: w * .3,
  //     child: FittedBox(
  //       child: Card(
  //         color: const Color(0xFFf6f8ff).withOpacity(.9),
  //         elevation: 4,
  //         clipBehavior: Clip.hardEdge,
  //         // margin: EdgeInsets.symmetric(vertical: h*.01,),
  //         child: Column(
  //           children: [
  //             SizedBox(height: h * .00000001),
  //             GestureDetector(
  //               child: Column(
  //                 children: [
  //                   Image.asset(
  //                     "assets/images/Cloud Transfer Logo Template_prev_ui.png",
  //                     width: w * .6,
  //                     height: h * .2,
  //                   ),
  //                 ],
  //               ),
  //               onTap: () {
  //                 showModalBottomSheet(
  //                     elevation: 10,
  //                     backgroundColor: Colors.white12,
  //                     context: context,
  //                     builder: (ctx) => Container(
  //                           width: w * .06,
  //                           height: h * .2,
  //                           color: Colors.white54,
  //                           alignment: Alignment.center,
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Buttons("Pick from gallery", 0xFF21325E,
  //                                   () async {
  //                                 if (type == "nurse") {
  //                                   imagefromgallery("nurse");
  //                                 } else if (type == "card") {
  //                                   imagefromgallery("card");
  //                                 } else if (type == "cv") {
  //                                   imagefromgallery("cv");
  //                                 }
  //                               },
  //                                   const Icon(Icons
  //                                       .photo_size_select_actual_outlined)),
  //                               SizedBox(height: h * .015),
  //                               Buttons("Pick from camera", 0xFF21325E,
  //                                   () async {
  //                                 if (type == "nurse") {
  //                                   imagefromcamera("nurse");
  //                                 } else if (type == "card") {
  //                                   imagefromcamera("card");
  //                                 } else if (type == "cv") {
  //                                   imagefromcamera("cv");
  //                                 }
  //                               }, const Icon(Icons.camera_alt)),
  //                             ],
  //                           ),
  //                         ));
  //               },
  //             ),
  //             Container(
  //               child: Text(txt),
  //               alignment: Alignment.center,
  //               // padding: EdgeInsets.only(bottom: h*.01 ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // imgProfilepicker(BuildContext context, File? image, String type) {
  //   double h = MediaQuery.of(context).size.height;
  //   double w = MediaQuery.of(context).size.width;

  //   return Container(
  //     alignment: Alignment.center,

  //     padding: EdgeInsets.only(top: h * .01),
  //     height: h * .25,
  //     width: w * .3,
  //     child: Stack(children: <Widget>[
  //       const CircleAvatar(
  //           radius: 80.0,
  //           backgroundColor: Colors.white70,
  //           backgroundImage: const AssetImage("assets/images/person.jpg")),
  //       Positioned(
  //         bottom: 17.0,
  //         right: 10.0,
  //         child: InkWell(
  //           onTap: () {
  //             showModalBottomSheet(
  //                 elevation: 10,
  //                 backgroundColor: Colors.white12,
  //                 context: context,
  //                 builder: (ctx) => Container(
  //                       width: w * .06,
  //                       height: h * .2,
  //                       color: Colors.white54,
  //                       alignment: Alignment.center,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Buttons("Pick from gallery", 0xFF21325E, () async {
  //                             if (type == "nurse") {
  //                               imagefromgallery("nurse");
  //                             } else if (type == "card") {
  //                               imagefromgallery("card");
  //                             } else if (type == "cv") {
  //                               imagefromgallery("cv");
  //                             }
  //                           },
  //                               const Icon(
  //                                   Icons.photo_size_select_actual_outlined)),
  //                           SizedBox(height: h * .015),
  //                           Buttons("Pick from camera", 0xFF21325E, () async {
  //                             if (type == "nurse") {
  //                               imagefromcamera("nurse");
  //                             } else if (type == "card") {
  //                               imagefromcamera("card");
  //                             } else if (type == "cv") {
  //                               imagefromcamera("cv");
  //                             }
  //                           }, const Icon(Icons.camera_alt)),
  //                         ],
  //                       ),
  //                     ));
  //           },
  //           child: const Icon(
  //             Icons.camera_alt,
  //             color: Colors.white54,
  //             size: 28.0,
  //           ),
  //         ),
  //       ),
  //     ]),

  //     // Card(
  //     //   color: const Color(0xFFf6f8ff).withOpacity(.9),
  //     //   elevation: 4,
  //     //   clipBehavior: Clip.hardEdge,
  //     //   // margin: EdgeInsets.symmetric(vertical: h*.01,),
  //     //   child: Column(
  //     //     children: [
  //     //       SizedBox(height: h * .00000001),
  //     //       GestureDetector(
  //     //         child: Column(
  //     //           children: [
  //     //             Image.asset(
  //     //               "assets/images/Cloud Transfer Logo Template_prev_ui.png",
  //     //               width: w * .6,
  //     //               height: h * .2,
  //     //             ),
  //     //           ],
  //     //         ),
  //     //         onTap: () {
  //     //          },
  //     //       ),
  //     //       // Container(
  //     //       //   child: Text(txt),
  //     //       //   alignment: Alignment.center,
  //     //       //   // padding: EdgeInsets.only(bottom: h*.01 ),
  //     //       // ),
  //     //     ],
  //     //   ),
  //     // ),
  //   );
  // }

  // imagefromgallery(String type) async {
  //   File? image;
  //   var picked = await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (picked != null) {
  //     if (type == "nurse") {
  //       setState(() {
  //         nurseimage = File(picked.path);
  //       });
  //     } else if (type == "card") {
  //       setState(() {
  //         cardimage = File(picked.path);
  //       });
  //     } else if (type == "cv") {
  //       setState(() {
  //         cvFile = File(picked.path);
  //       });
  //     }
  //   }
  // }

  // imagefromcamera(String type) async {
  //   File? image;
  //   var picked = await ImagePicker().getImage(source: ImageSource.camera);
  //   if (picked != null) {
  //     if (type == "nurse") {
  //       setState(() {
  //         nurseimage = File(picked.path);
  //       });
  //     } else if (type == "card") {
  //       setState(() {
  //         cardimage = File(picked.path);
  //       });
  //     } else if (type == "cv") {
  //       setState(() {
  //         cvFile = File(picked.path);
  //       });
  //     }
  //   }
  // }

  // Stack cancelimage(
  //     double h, double w, BuildContext context, File image, String type) {
  //   return Stack(
  //     children: [
  //       Container(
  //           padding: EdgeInsets.only(top: h * .01),
  //           height: h * .25,
  //           width: w,
  //           child: Card(
  //             color: const Color(0xFFf6f8ff).withOpacity(.9),
  //             elevation: 4,
  //             clipBehavior: Clip.hardEdge,
  //             // margin: EdgeInsets.symmetric(vertical: h*.01,),
  //             child: Image.file(image),
  //           )),
  //       Positioned(
  //         right: -2,
  //         top: -2,
  //         child: IconButton(
  //             icon: const Icon(Icons.cancel),
  //             onPressed: () {
  //               alterimage(context, image, type);
  //             }),
  //       ),
  //     ],
  //   );
  // }

  // alterimage(context, File? image, String type) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: const Text("Do you want to remove picture"),
  //         actions: [
  //           TextButton(
  //               onPressed: () async {
  //                 if (type == "nurse") {
  //                   setState(() {
  //                     nurseimage = null;
  //                   });
  //                 } else if (type == "card") {
  //                   setState(() {
  //                     cardimage = null;
  //                   });
  //                 } else if (type == "cv") {
  //                   setState(() {
  //                     cvFile = null;
  //                   });
  //                 }
  //                 Get.back();
  //               },
  //               child: const Text("Yes")),
  //           TextButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               child: const Text("No"))
  //         ],
  //       );
  //     },
  //   );
  // }