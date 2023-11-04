import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../Controlers/C_Medicine/medicine_contoller.dart';
import '../../Model/M_Medicine/button.dart';
import '../../Model/M_Medicine/input_field.dart';
import '../../Model/M_Medicine/medicine.dart';
import '../../themes.dart';

class AddMed extends StatefulWidget {
  const AddMed({Key? key}) : super(key: key);

  @override
  _AddMedState createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  final MedicineContoller _medicineContoller = Get.put(MedicineContoller());
  DateTime _selectedate = DateTime.now();
  DateTime _Enddate = DateTime.now().add(const Duration(days: 1));
  String _starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectinterval = 1;
  List<int> IntervalList = [1, 2, 3];
  String _selectrepet = "يوميا";
  List<String> RepetList = [
    "مرة واحدة",
    "يوميا",
    "حتي تاريخ معين",
    "عدد ايام معين"
  ];
  String _type = "اقراص";
  List<String> typelist = [
    "اقراص",
    "كبسولات",
    "حقن",
    "قلم انسولين",
    "شراب",
    "قطرات",
    "مرهم",
    "كريمات",
    "استنشاق",
  ];
  int _amount = 1;
  List<int> amountlist = [1, 2, 3];
  String _unit = "قرص";
  List<String> unitlist = [
    "قرص",
    "كبسولة",
    "مللي",
    "وحدة",
    "مللي/معلقة",
    "قطرة",
    "بخة",
  ];
  int? _typevalue = 0;
  int? _amountvalue = 0;
  int? _unitvalue = 0;

  int? _selectedimage;

  final TextEditingController _medname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '_medaddnew'.tr,
                style: HeadingStyle,
              ),
              InputField(
                title: '_medname'.tr,
                hint: "",
                controller: _medname,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           _showtype();
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 52,
              //           margin: const EdgeInsets.only(top: 8),
              //           padding: const EdgeInsets.only(left: 8),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               color: Colors.grey,
              //               width: 1,
              //             ),
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //           child: Text(
              //             _type,
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Text('_medtype'.tr),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _showunit();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _unit,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _showamount();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _amount.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('_meddose'.tr),
                ],
              ),
              InputField(
                title: '_medstartdate'.tr,
                hint: DateFormat.yMd().format(_selectedate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: '_medstarttime'.tr,
                      hint: _starttime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser();
                        },
                        icon: const Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InputField(
                      title: '_medinterval'.tr,
                      hint: "$_selectinterval",
                      widget: DropdownButton(
                        underline: Container(
                          height: 0,
                        ),
                        icon: const Icon(Icons.arrow_downward),
                        style: SubTitleStyle,
                        iconSize: 30,
                        items: IntervalList.map<DropdownMenuItem<String>>(
                            (int value) {
                          return DropdownMenuItem(
                              value: value.toString(),
                              child: Text(
                                value.toString(),
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectinterval = int.parse(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: '_medduratoin'.tr,
                hint: _selectrepet,
                widget: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  icon: const Icon(Icons.arrow_downward),
                  style: SubTitleStyle,
                  iconSize: 30,
                  items:
                      RepetList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectrepet = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _selectrepet == 'يوميا'
                  ? Container()
                  : _selectrepet == 'مرة واحدة'
                      ? Container()
                      : _selectrepet == 'حتي تاريخ معين'
                          ? InputField(
                              title: "تاريخ الانتهاء",
                              hint: DateFormat.yMd().format(_Enddate),
                              widget: IconButton(
                                icon: const Icon(Icons.calendar_today_outlined),
                                onPressed: () {
                                  _getEndDateFromUser();
                                },
                              ),
                            )
                          : Center(
                              child: Container(
                                height: 52,
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomNumberPicker(
                                  initialValue: 2,
                                  maxValue: 30,
                                  minValue: 2,
                                  step: 1,
                                  onValue: (value) {},
                                ),
                              ),
                            ),
              Text(
                '_medtype'.tr,
                style: TitleStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              _Medicinetype(),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Button(
                  label: '_medsave'.tr,
                  onTap: () {
                    // print(_medname.text);
                    // print(_selectedate);
                    // print(_Enddate);
                    // print(_selectinterval);
                    // print(_selectrepet);
                    // print(_starttime);
                    // print(_type);
                    // print(_amount);
                    // print(_unit);
                    _validate();
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  _validate() {
    if (_medname.text.isNotEmpty) {
      _addMedTodb();
      Get.back();
      _medicineContoller.getMedicines();
    } else {
      Get.snackbar('_medalart', '_medalartNote',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red,
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
    }
  }

  _addMedTodb() async {
    await _medicineContoller.addmed(
        medicine: Medicine(
      name: _medname.text,
      date: DateFormat.yMd().format(_selectedate),
      starttime: _starttime,
      interval: _selectinterval,
      repet: _selectrepet,
      image: _selectedimage,
      iscompleted: 0,
    ));
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        // IconButton(
        //   icon: Icon(
        //     Icons.settings,
        //     size: 20,
        //     color: Get.isDarkMode ? Colors.white : Colors.black,
        //   ),
        //   onPressed: () {
        //     Get.to(const Settings());
        //   },
        // ),
        // // const SizedBox(
        // //   width: 20,
        // // ),
      ],
    );
  }

  _Medicinetype() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedimage = index;
              });
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 60,
                    height: 80,
                    child: index == 0
                        ? Image.asset(
                            'assets/images/capsule.png',
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          )
                        : index == 1
                            ? Image.asset('assets/images/cream.png')
                            : index == 2
                                ? Image.asset('assets/images/drops.png')
                                : index == 3
                                    ? Image.asset('assets/images/pills.png')
                                    : index == 4
                                        ? Image.asset(
                                            'assets/images/syringe.png')
                                        : Image.asset(
                                            'assets/images/syrup.png'),
                  ),
                ),
                Container(
                  child: _selectedimage == index
                      ? const Icon(
                          Icons.done,
                          size: 50,
                          color: Colors.blue,
                        )
                      : Container(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );

    if (_pickDate != null) {
      setState(() {
        _selectedate = _pickDate;
      });
    } else {}
  }

  _getEndDateFromUser() async {
    DateTime? _pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );

    if (_pickDate != null) {
      setState(() {
        _Enddate = _pickDate;
      });
    } else {}
  }

  _getTimeFromUser() async {
    String? _formatedtime;
    TimeOfDay? _pickTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_starttime.split(":")[0]),
        minute: int.parse(_starttime.split(":")[1].split(" ")[0]),
      ),
    );
    if (_pickTime != null) {
      _formatedtime = _pickTime.format(context);
    } else {
      _formatedtime = _starttime;
    }

    if (_pickTime != null) {
      setState(() {
        _starttime = _formatedtime!;
      });
    } else {}
  }

  _showtype() async {
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
                        height: 400,
                        child: ListView.builder(
                            itemCount: typelist.length,
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(typelist[i]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                      value: i,
                                      groupValue: _typevalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _typevalue = value;
                                        });
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
                      child: Text('_meddone'.tr)),
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
      _type = typelist[_typevalue!];
    });
  }

  _showamount() async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                title: Center(child: Text('_meddose'.tr)),
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            itemCount: amountlist.length,
                            itemBuilder: (context, i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(amountlist[i].toString()),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                      value: i,
                                      groupValue: _amountvalue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _amountvalue = value;
                                        });
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
                      child: Text('_meddone'.tr)),
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
      _amount = amountlist[_amountvalue!];
    });
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
                        height: 300,
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
                      child: Text('_meddone'.tr)),
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

  // _getTimeFromUser() {
  //   var _pickTime = _showpicktime();
  //   String _formatedtime = _pickTime.format(_pickTime);
  //   if (_pickTime == null) {
  //     print("time cancel");
  //   } else {
  //     setState(() {
  //       _starttime = _formatedtime;
  //     });
  //   }
  // }

  // _showpicktime() {
  //   return showTimePicker(
  //       initialEntryMode: TimePickerEntryMode.input,
  //       context: context,
  //       initialTime: TimeOfDay(hour: 9, minute: 10));
  // }
}
