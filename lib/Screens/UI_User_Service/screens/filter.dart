import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_User_Service/components/nurseitem.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/searchat.dart';
import 'package:graduation_project/themes.dart';

import '../../../DB/Models/M_nurse/nurse_model.dart';
import '../../../DB/Models/M_user/usercontroler.dart';
import '../../../Model/Home/Address/Address.dart';
import '../../../Model/Home/Address/addresscontroller.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

List<String> unitlist = [
  '_registeredNurse'.tr,
  '_nurseTech'.tr,
  '_nurseAid'.tr,
  '_all'.tr,
];
String _unit = "";

int? _unitvalue = 0;
List<String> genderlist = ['_male'.tr, '_female'.tr, '_both'.tr];
String _gender = "";

int? _gendervalue = 0;
double _value = 100;
var selectedRange = const RangeValues(100, 150);
RangeValues values = const RangeValues(100, 1000);

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text("Title".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      height: 200,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, childAspectRatio: 8),
                          itemCount: unitlist.length,
                          itemBuilder: (context, i) {
                            return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(unitlist[i]),
                                  Radio(
                                      value: i,
                                      groupValue: _unitvalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _unitvalue = value;
                                        });
                                        print(_unitvalue);
                                      }),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text("Gender".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      height: 90,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 3),
                          itemCount: genderlist.length,
                          itemBuilder: (context, i) {
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(genderlist[i]),
                                  Radio(
                                      value: i,
                                      groupValue: _gendervalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _gendervalue = value;
                                        });
                                        print(_gendervalue);
                                      }),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text("Vezeta".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                        height: 90,
                        child: RangeSlider(
                          values: selectedRange,
                          min: 0,
                          max: 1000,
                          onChanged: (RangeValues newRange) {
                            setState(() {
                              selectedRange = newRange;
                            });
                          },
                          divisions: 100,
                          labels: RangeLabels(
                              '${selectedRange.start}', '${selectedRange.end}'),
                        )),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Get.off(FilterSearch(
                    title: _unitvalue,
                    gender: _gendervalue,
                    vezeta: selectedRange,
                  ));
                  print(_unitvalue);
                  print(_gendervalue);
                  print(selectedRange.start);
                  print(selectedRange.end);
                },
                child: Text('_Confirm'.tr),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterSearch extends StatefulWidget {
  int? title;
  int? gender;
  RangeValues? vezeta;
  FilterSearch(
      {Key? key,
      required this.title,
      required this.gender,
      required this.vezeta})
      : super(key: key);

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  UserControler userControler = Get.put(UserControler());
  addcontroller controller = Get.put(addcontroller());
  List<String> unitlist = [
    'Price Low to High',
    'Price High to Low',
    'Rating Low to High',
    'Rating High to Low',
  ];
  String _unit = "";

  int? _unitvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF002536),
        elevation: 10,
        shadowColor: const Color(0xFF002536),
        title: Text(
          '_Nursing'.tr,
          textAlign: TextAlign.center,
        ),
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              color: Colors.grey[300],
              margin: const EdgeInsets.only(top: 1.0),
              padding: const EdgeInsets.only(left: 10.0),
              height: 60,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showunit();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort,
                            color: Colors.grey[600],
                          ),
                          Text('Sort',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                const Address(),
                                RaisedButton(
                                  onPressed: () {
                                    Get.off(SearchAt(
                                      type: false,
                                      category: '',
                                      city: controller.city.value,
                                      cityid: controller.cityid.value,
                                    ));
                                  },
                                  child: const Text("confirm"),
                                )
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort,
                            color: Colors.grey[600],
                          ),
                          Text('Place',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: switch_firebase_query(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length == 0) {
                      return const Center(
                        child: Text('No Data'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            int cityid = snapshot.data.docs[i].data()['city'];
                            int govid =
                                snapshot.data.docs[i].data()['government'];
                            NurseModel nurse = NurseModel.fromJson(
                              snapshot.data.docs[i].data(),
                              controller.getcityname(cityid)!,
                              controller.getgovname(govid)!,
                            );

                            return item(nurse: nurse);
                          });
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: _nurses.length,
      //   itemBuilder: (context, index) {
      //     return item(nurse: _nurses[index]);
      //   },
      // ),
    );
  }

  _showunit() async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                title: Center(child: Text('_medunit'.tr)),
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: unitlist.length,
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(unitlist[i]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                      value: i,
                                      groupValue: _unitvalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _unitvalue = value;
                                        });
                                        print(_unitvalue);
                                      }),
                                ],
                              );
                            }),
                      ),
                    ]),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('_ok'.tr)),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('_medclose'.tr))
                ],
              );
            },
          );
        });
    setState(() {
      _unit = unitlist[_unitvalue!];
    });
  }

  switch_firebase_query() async {
    //if title is all

    if (widget.title == 3) {
      if (widget.gender == 0) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('gender', isEqualTo: 2)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
      if (widget.gender == 1) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('gender', isEqualTo: 1)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }

      if (widget.gender == 2) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
    }
    ////////////////////////////////////////////////////////////
    //if title is اخصائي

    if (widget.title == 0) {
      if (widget.gender == 0) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title',
                whereIn: ['أخصائي تمريض', 'Registered nurse - Qualified nurse'])
            .where('gender', isEqualTo: 2)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
      if (widget.gender == 1) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title',
                whereIn: ['أخصائي تمريض', 'Registered nurse - Qualified nurse'])
            .where('gender', isEqualTo: 1)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }

      if (widget.gender == 2) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title',
                whereIn: ['أخصائي تمريض', 'Registered nurse - Qualified nurse'])
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
    }
    ////////////////////////////////////////////////////////////
    //if title is فني

    if (widget.title == 1) {
      if (widget.gender == 0) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['Technical nurse - Nurse', 'فني تمريض'])
            .where('gender', isEqualTo: 2)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
      if (widget.gender == 1) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['Technical nurse - Nurse', 'فني تمريض'])
            .where('gender', isEqualTo: 1)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }

      if (widget.gender == 2) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['Technical nurse - Nurse', 'فني تمريض'])
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
    }
    ////////////////////////////////////////////////////////////
    //if title is مساعد

    if (widget.title == 2) {
      if (widget.gender == 0) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['مساعد تمريض', 'Nurse aid'])
            .where('gender', isEqualTo: 2)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
      if (widget.gender == 1) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['مساعد تمريض', 'Nurse aid'])
            .where('gender', isEqualTo: 1)
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }

      if (widget.gender == 2) {
        return FirebaseFirestore.instance
            .collection('nurse')
            .where('title', whereIn: ['مساعد تمريض', 'Nurse aid'])
            .where('price',
                isGreaterThanOrEqualTo: widget.vezeta!.start.toInt())
            .where('price', isLessThanOrEqualTo: widget.vezeta!.end.toInt())
            .get();
      }
    }
    ////////////////////////////////////////////////////////////
  }
}
