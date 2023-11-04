import 'dart:ffi';

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:graduation_project/DB/Models/M_user/usercontroler.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';
import 'package:graduation_project/Screens/Additional/UI_ToDo/notes_list.dart';
import 'package:graduation_project/Screens/UI_User_Service/models/Homepagemodel.dart';
import 'package:graduation_project/Screens/UI_User_Service/models/category.dart';
import 'package:graduation_project/Screens/UI_User_Service/models/newhomepagemodel.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/doctor_list.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nursepage.dart';
import 'package:graduation_project/themes.dart';

import '../../Additional/Settings.dart';
import '../../UI_Medicine/home_page.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({Key? key}) : super(key: key);
  //final List<Data> itemdata = [Data(imageurl: "imageurl", text: "text")];
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentindex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserControler usercontroller = Get.put(UserControler());
    addcontroller controller = Get.put(addcontroller());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // controller from GetView
    return usercontroller.obx((state) {
      return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
              backgroundColor: PrimaryColor,
              elevation: 4,
              title: Text(
                "_homepage".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: white),
              ),
              centerTitle: true,
              actions: const [
                // IconButton(onPressed: (){}, icon: Icon(Icons.ed)),
              ]),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  // minLeadingWidth: w*.3,
                  leading: CircleAvatar(
                    radius: width * .11,
                    backgroundImage: NetworkImage(
                      usercontroller.user!.image!,
                    ),
                  ),
                  title: Text(usercontroller.user!.firstName! +
                      " " +
                      usercontroller.user!.lastName!),
                  subtitle: Text(
                    usercontroller.user!.email!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                  contentPadding: EdgeInsets.only(
                      bottom: height * .01,
                      left: width * .000001,
                      right: width * .000001,
                      top: height * .15),

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      // Get.to(const EditUserProfile());
                    },
                  ),
                ),
                Divider(
                  color: Get.isDarkMode ? white : darkGreyClr,
                  thickness: 1,
                  indent: width * .06,
                  endIndent: width * .001,
                ),
                ListTile(
                  onTap: () {
                    Get.to(const Settings());
                  },
                  leading: const Icon(Icons.settings),
                  title: Text('_settings'.tr),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const NoteList());
                  },
                  leading: const Icon(Icons.note_sharp),
                  title: Text('_addNotes'.tr),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const HomePage());
                  },
                  leading: const Icon(Icons.note_sharp),
                  title: Text('2'.tr),
                ),
                ListTile(
                  onTap: () {
                    // Get.to(const Settings());
                  },
                  leading: const Icon(Icons.note_sharp),
                  title: Text('6'.tr),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' ${'_hello'.tr} ${usercontroller.user!.firstName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.waving_hand_rounded,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (() {
                    showSearch(context: context, delegate: datasearch());
                  }),
                  child: Container(
                    height: height / 12,
                    width: width / 1.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.isDarkMode
                          ? DarkGrey.withOpacity(.9)
                          : const Color(0xFFF2F2F2).withOpacity(.97),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          Expanded(
                              child: Text(
                            '_search'.tr,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: height / 12,
                              width: height / 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(55, 82, 178, 1),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: width / 1.1,
                  child: Text(
                    '_How'.tr,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .03,
                  ),
                  height: height * .20,
                  width: width,
                  child: GridView.builder(
                      itemCount: Homeconmodel.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: .8,
                      ),
                      itemBuilder: (context, index) =>
                          homepagemodel(homconm: Homeconmodel[index])) //
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: width / 1.1,
                  child: Text(
                    '_popular'.tr,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .03,
                      ),
                      height: height * .25,
                      width: width,
                      child: GridView.builder(
                          itemCount: itemdata.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: .8,
                          ),
                          itemBuilder: (context, index) =>
                              newhomepagemodel(homconm: itemdata[index])) //
                      ),
                ),
              ),
            ],
          ),
          floatingActionButton: CircleAvatar(
              radius: 30,
              backgroundColor: PrimaryColor,
              child: IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(
                        "${usercontroller.user!.phone2}");
                  })));
    });
  }
}
/*  body: 
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .2,
                        width: width,
                        child: Image.asset(
                          "assets/Team.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: Text(
                          ' ${'_hello'.tr} ${usercontroller.user!.firstName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Stack(
                        children: [
                          Container(
                            height: height * .25,
                            width: width,
                            // margin: EdgeInsets.only(bottom: height * .12),

                            color: PrimaryColor,

                            /* padding: EdgeInsets.only(
                                left: width * .04,
                                top: height * .025,
                                bottom: height * .025,
                                right: width * .1),
                            margin: EdgeInsets.only(
                                left: width * .03,
                                top: height * .02,
                                right: width * .06),
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width * .09),
                                bottomRight: Radius.circular(width * .09),
                              ),
                            ),*/
                          ),
                          Positioned(
                            top: height * .02,
                            left: 0,
                            right: 0,
                            bottom: height * .02,
                            child: SingleChildScrollView(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * .03,
                                  ),
                                  height: height * .25,
                                  width: width * .8,
                                  child: GridView.builder(
                                      itemCount: Homeconmodel.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: .8,
                                      ),
                                      itemBuilder: (context, index) =>
                                          homepagemodel(
                                              homconm: Homeconmodel[index])) //
                                  ),
                            ),
                          ),
                        ],
                      ),

                      /* Container(
                        padding: const EdgeInsets.all(4.0),
                        child: const Text(
                          "Specialties",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 200,
                        child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('category')
                                .get(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1),
                                    itemCount: 4 + 1,
                                    itemBuilder: (context, i) {
                                      if (i < 4) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(homebage());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Card(
                                              elevation: 5,
                                              child: Column(children: [
                                                Image.network(
                                                  snapshot.data!.docs[i]
                                                      .data()['image'],
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[i]
                                                        .data()['namecat'.tr],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        overflow:
                                                            TextOverflow.clip),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        );
                                      } else if (i == 4) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(const AllCategory());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Card(
                                              elevation: 5,
                                              child: Column(children: [
                                                Expanded(
                                                    child: Image.asset(
                                                        'assets/dhead.png')),
                                                Text(
                                                  '_ShowAllSpecialties'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      overflow:
                                                          TextOverflow.clip),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ]),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    });
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
            
            
            
            
            
            
                      ),*/

                      /* Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const Text(
                              "Heighest Rate",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.to(const homebage());
                                },
                                icon: const Icon(Icons.arrow_forward))
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 400,
                          child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("nurse")
                                .where('rate', isGreaterThanOrEqualTo: 3.5)
                                .get(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, i) {
                                    int cityid =
                                        snapshot.data.docs[i].data()['city'];
                                    int govid = snapshot.data.docs[i]
                                        .data()['government'];
                                    NurseModel nurse = NurseModel.fromJson(
                                      snapshot.data.docs[i].data(),
                                      controller.getcityname(cityid)!,
                                      controller.getgovname(govid)!,
                                    );
                                    return item(nurse: nurse);
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text("No data"),
                                );
                              }
                            },
                          )),*/
                    ]),
              ),
            ));
      },
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}*/

// ignore: non_constant_identifier_names
Widget CreateCategory(categorymodel category) => InkWell(
      onTap: () {
        Get.to(homebage());
      },
      child: Container(
        // color: Colors.white,
        padding: const EdgeInsets.all(15),
        width: 128,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 70,
              height: 70,
              child: Image.asset(
                category.image,
                color: Colors.grey,
              ),
            ),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );

class Data {
  final String imageurl, text;
  Callback? fun;
  Data({required this.imageurl, required this.text, this.fun});
}

class datasearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Text("body search");
  }
}
