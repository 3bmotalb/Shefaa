// ignore_for_file: unused_field, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/testttttttttt.dart';

import '../../themes.dart';
import '../Home/SignradioBtn.dart';
import '../Home/textFormField.dart';

class ProfessionalTittle extends StatefulWidget {
  const ProfessionalTittle({Key? key}) : super(key: key);

  @override
  State<ProfessionalTittle> createState() => ProfessionalTittleState();
}

String? professionalTitleValuedoc;

class ProfessionalTittleState extends State<ProfessionalTittle> {
  var professionalTitleItems = [
    '_all'.tr,
    '_professor'.tr,
    '_assistantProfessor'.tr,
    '_lecturer'.tr,
    '_assistantLecturer'.tr,
    '_specialist'.tr,
    '_consultant'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      width: w * .95,
      height: h * .1,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: DarkBlue,
            ),
            borderRadius: BorderRadius.circular(.06),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: DarkBlue, width: .9)),
        ),
        validator: (value) => value == null ? "_emptyField".tr : null,
        hint: Text(
          '_notSelected'.tr,
         style: TextStyle(
        color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        ),

        value: professionalTitleValuedoc,

        icon: const Icon(Icons.keyboard_arrow_down),

        items: professionalTitleItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items, ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            professionalTitleValuedoc = newValue;
          });
        },
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

class MultiLineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;

  const MultiLineTextField({Key? key, this.controller, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: DarkBlue,
      style: const TextStyle(color: Color(0xFF1D242B)),
      controller: controller,
      obscureText: false,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("_emptyField".tr);
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.9,
            color: Color(0xFF324E7B),
          ),
          borderRadius: BorderRadius.circular(.06),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: DarkBlue, width: .9)),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('_selectTopic'.tr),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child:  Text('_cancel'.tr,style: TextStyle(color: const Color(0xFF29435c).withOpacity(.8))),
          onPressed: _cancel,

        ),
        ElevatedButton(
          child: Text('_submit'.tr),
          onPressed: _submit,
            style:
            ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                      (states) =>
                  const Color(0xFF29435c).withOpacity(.8)),)
        ),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

class DocSpecialises extends StatefulWidget {
  const DocSpecialises({Key? key}) : super(key: key);

  @override
  State<DocSpecialises> createState() => _DocSpecialisesState();
}

String? selectedValue;

class _DocSpecialisesState extends State<DocSpecialises> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: h * .1,
            width: w * .95,
            child: DropdownButtonFormField(
              isExpanded: true,
              // alignment: Alignment.topLeft,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: DarkBlue,
                  ),
                  borderRadius: BorderRadius.circular(.06),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: DarkBlue, width: .9)),
                // filled: true,
              ),
              validator: (value) => value == null ? "_emptyField".tr : null,

              iconEnabledColor: Get.isDarkMode
                  ? const Color(0xFF387C6D)
                  : const Color(0xFF387C6D),

              // dropdownColor: Colors.amber,
              hint: Text(
                "_notSelected".tr,
                style: TextStyle(
                    color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),

              items: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return DropdownMenuItem<String>(
                  value: document.id,
                  child: Text(
                    data['namecat'.tr],
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
          );
        });
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

class DocSubSpecialises extends StatefulWidget {
  const DocSubSpecialises({Key? key}) : super(key: key);

  @override
  _DocSubSpecialisesState createState() => _DocSubSpecialisesState();
}

class _DocSubSpecialisesState extends State<DocSubSpecialises> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    final List<String> _items = [
      'Dermatology (Skin)',
      'Dentistry (Teeth)',
      'Psychiatry (Mental, Emotional or Behavioral Disorders)',
      'Pediatrics and New Born (Child)',
      'Neurology (Brain & Nerves)',
      'Orthopedics (Bones)',
      'Gynaecology and Infertility',
      'Ear, Nose and Throat',
      'Cardiology and Vascular Disease (Heart)',
      'Allergy and Immunology (Sensitivity and Immunity)',
      " Andrology and Male Infertility",
      "Audiology",
      "Cardiology and Thoracic Surgery (Heart & Chest)",
      'Chest and Respiratory',
      'Diabetes and Endocrinology',
      'Diagnostic Radiology (Scan Centers)',
      'Dietitian and Nutrition',
      'Family Medicine',
      'Gastroenterology and Endoscopy',
      "General Practice",
      "General Surgery",
      'Geriatrics (Old People Health)',
      'Hematology',
      'Internal Medicine',
      'IVF and Infertility',
      'Laboratories',
      'Nephrology',
      'Neurosurgery (Brain & Nerves Surgery)'
          'Obesity and Laparoscopic Surgery',
      'Oncology (Tumor)',
      'Oncology Surgery (Tumor Surgery)',
      'Ophthalmology (Eyes)',
      'Osteopathy (Osteopathic Medicine)',
      'Pain Management',
      'Pediatric Surgery',
      'Phoniatrics (Speech)',
      'Physiotherapy and Sport Injuries',
      'Plastic Surgery',
      'Rheumatology',
      'Spinal Surgery',
      'Urology (Urinary System)',
      'Vascular Surgery (Arteries and Vein Surgery)',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        SizedBox(
          height: h * .1,
          width: w * .95,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: const Color(0xFF387C6D),
              side: const BorderSide(color: darkGreyClr, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select other Specialise',
                  style: TextStyle(
                      color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            onPressed: _showMultiSelect,
          ),
        ),
        Divider(
          height: h * .01,
        ),
        // display selected items
        Wrap(
          children: _selectedItems
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
List<String> selectedItemslang = [];

class SpokenLan extends StatefulWidget {
  const SpokenLan({Key? key}) : super(key: key);

  @override
  State<SpokenLan> createState() => _SpokenLanState();
}

class _SpokenLanState extends State<SpokenLan> {
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      '_english'.tr,
      '_arabic'.tr,
      'chinese'.tr,
      '_hindi'.tr,
      '_spanish'.tr,
      '_french'.tr,
      '_russian'.tr,
      '_german'.tr,
      '_italian'.tr,
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItemslang = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        SizedBox(
          height: h * .07,
          width: w * .95,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Blue,
              side: const BorderSide(color: darkGreyClr, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '_selectLan'.tr,
                  style: TextStyle(
                      color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            onPressed: _showMultiSelect,
          ),
        ),
        Divider(
          height: h * .02,
        ),
        // display selected items
        Wrap(
          children: selectedItemslang
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
List<String> selectedItemstimes = [];

class DocAvailableTime extends StatefulWidget {
  const DocAvailableTime({Key? key}) : super(key: key);

  @override
  State<DocAvailableTime> createState() => _DocAvailableTimeState();
}

class _DocAvailableTimeState extends State<DocAvailableTime> {
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'All Day',
      'Morning',
      'Night ',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItemstimes = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        SizedBox(
          height: h * .1,
          width: w * .95,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Blue,
              side: const BorderSide(color: darkGreyClr, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select time',
                  style: TextStyle(
                      color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            onPressed: _showMultiSelect,
          ),
        ),
        const Divider(
          height: 30,
        ),
        // display selected items
        Wrap(
          children: selectedItemstimes
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
DateTime? selected;

class PickYear extends StatefulWidget {
  const PickYear({Key? key}) : super(key: key);

  @override
  State<PickYear> createState() => _PickYearState();
}

class _PickYearState extends State<PickYear> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: w * .2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: SecondColor,
                  fixedSize: Size(w * .7, h * .06),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * .1))),
              onPressed: () {
                _selectDate(context);
              },
              child: Text("_tabToSelect".tr, style: SignTitles),
            ),
          ),
          SizedBox(
            height: h * .02,
          ),
          Visibility(
            visible: _selected,
            child: Row(
              children: [
                Text(
                  '_graduationDate_'.tr,
                  style: SignTitles,
                ),
                selected != null
                    ? Text("${selectedDate.month}/${selectedDate.year}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Get.isDarkMode ? Blue : Blue,
                        )))
                    : Container(),
              ],
            ),
          ),
        ]);
  }

  DateTime selectedDate = DateTime(DateTime.now().year - 1);
  // = DateFormat.YEAR_MONTH as DateTime;
  // DateTime intialDate = DateTime.now();
  bool _selected = false;

  _selectDate(BuildContext context) async {
    selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendar,
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF89A3B2), // header background color
              onPrimary: white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected!;
        _selected = true;
      });
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
class ExaminationFees extends StatefulWidget {
  const ExaminationFees({Key? key}) : super(key: key);

  @override
  State<ExaminationFees> createState() => _ExaminationFeesState();
}

TextEditingController? examinationFeesValue;

class _ExaminationFeesState extends State<ExaminationFees> {
  var professionalTitleItems = [
    '_lessThan50'.tr,
    '_from50to100'.tr,
    '_from100to200'.tr,
    '_from200to300'.tr,
    '_graterThan300'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          "_examinationFees".tr,
          style: SignTitles,
        ),
        SizedBox(
          width: w * .02,
        ),
        SizedBox(
          height: h*.05,
          width: w*.25,
          child: TextFormField(
            cursorColor: DarkBlue,
            style: const TextStyle(color: Color(0xFF1D242B)),
            controller: examinationFeesValue,
            obscureText: false,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return ("_emptyField".tr);
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.9,
                  color: Color(0xFF324E7B),
                ),
                borderRadius: BorderRadius.circular(.06),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: DarkBlue, width: .9)),
            ),
          ),
        )
      ],

    );

    // return SizedBox(
    //   width: w * .95,
    //   height: h * .1,
    //   child: DropdownButtonFormField(
    //     isExpanded: true,
    //     decoration: InputDecoration(
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(
    //           width: 1,
    //           color: DarkBlue,
    //         ),
    //         borderRadius: BorderRadius.circular(.06),
    //       ),
    //       enabledBorder: const OutlineInputBorder(
    //           borderSide: BorderSide(color: DarkBlue, width: .9)),
    //     ),
    //     validator: (value) => value == null ? "_emptyField".tr : null,
    //     hint: Text(
    //       '_notSelected'.tr,
    //       style: TextStyle(
    //           color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 15),
    //     ),
    //
    //     value: examinationFeesValue,
    //
    //     icon: const Icon(Icons.keyboard_arrow_down),
    //
    //     items: professionalTitleItems.map((String items) {
    //       return DropdownMenuItem(
    //         value: items,
    //         child: Text(items, style: SignTitles),
    //       );
    //     }).toList(),
    //     // After selecting the desired option,it will
    //     // change button value to selected value
    //     onChanged: (String? newValue) {
    //       setState(() {
    //         examinationFeesValue = newValue;
    //       });
    //     },
    //   ),
    // );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
class HaveClinic extends StatefulWidget {
  const HaveClinic({Key? key}) : super(key: key);

  @override
  State<HaveClinic> createState() => _HaveClinicState();
}

TextEditingController clinicAddController = TextEditingController();
TextEditingController clinicNameController = TextEditingController();
TextEditingController aboutClinicController = TextEditingController();
TextEditingController clinicPhoneController = TextEditingController();

class _HaveClinicState extends State<HaveClinic> {
  Location location = Location();
  bool? _serviceEnabled;
  final bool _isListenLocation = false, _isGetLocation = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  ////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////
  final bool? _haveClinic = false;
  int? groupValue0;

  ValueChanged<int?> _valueChangedHandler() {
    return (value) => setState(() => groupValue0 = value!);
  }
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * .02,
        ),
        // Row(
        //   children: [
        //     MyRadioOption<int>(
        //       value: 1,
        //       groupValue: groupValue0,
        //       onChanged: _valueChangedHandler(),
        //       text: '_yes'.tr,
        //     ),
        //     SizedBox(
        //       width: w * .1,
        //     ),
        //     MyRadioOption<int>(
        //       value: 2,
        //       groupValue: groupValue0,
        //       onChanged: _valueChangedHandler(),
        //       text: '_no'.tr,
        //     ),
        //   ],
        // ),
        // groupValue0 == 1
        //     ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "_clinicName".tr,
              style: SignTitles,
            ),
            TxtFormField(
                "_clinicName".tr,
                TextInputType.streetAddress,
                " ",
                const Icon(Icons.place),
                IconButton(
                  icon: const Icon(null),
                  onPressed: () {},
                ),
                false,
                clinicNameController),
            Text(
              "_clinicAdd".tr,
              style: SignTitles,
            ),
            TxtFormField(
                "_clinicAddDetail".tr,
                TextInputType.streetAddress,
                " ",
                const Icon(Icons.place),
                IconButton(
                  icon: const Icon(null),
                  onPressed: () {},
                ),
                false,
                clinicAddController),
            // TextButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (ctx) => AlertDialog(
            //                 backgroundColor:
            //                     Get.isDarkMode ? darkGreyClr : white,
            //                 actionsOverflowDirection:
            //                     VerticalDirection.up,
            //                 actionsAlignment: MainAxisAlignment.start,
            //                 actions: <Widget>[
            //                   Column(
            //                     children: [
            //                       TxtButton(
            //                         txt: "_currentLocation".tr,
            //                         function: ()async {
            //                           _serviceEnabled=await location.serviceEnabled();
            //                           if(!_serviceEnabled!){
            //                             _serviceEnabled=await location.requestService();
            //                             if(_serviceEnabled!) return;
            //                           }
            //                           _permissionGranted=await location.hasPermission();
            //                           if(_permissionGranted == PermissionStatus.denied){
            //                             _permissionGranted=await location.requestPermission();
            //                             if(_permissionGranted!=PermissionStatus.granted) return;
            //                           }
            //                           _locationData=await location.getLocation();
            //                           setState(() {
            //                             _isGetLocation!=true;
            //
            //                           });
            //                           // Get.back();
            //                         },
            //                         color: Get.isDarkMode
            //                             ? white
            //                             : darkGreyClr,
            //                       ),
            //                       _isGetLocation? Text("Location:${_locationData!.latitude}& ${_locationData!.longitude}"):const Text("مش شغال "),
            //                       TxtButton(
            //                         txt: "_otherLocation".tr,
            //                         function: () {
            //                           Get.back();
            //                         },
            //                         color: Get.isDarkMode
            //                             ? white
            //                             : darkGreyClr,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         const Icon(Icons.add_location_alt),
            //         Text("_addLocation".tr),
            //       ],
            //     )),
            SizedBox(
              height: h * .02,
            ),
            // Text(
            //   "_examinationFees".tr,
            //   style: SignTitles,
            // ),
            // SizedBox(
            //   height: h * .02,
            // ),
            const ExaminationFees(),
            SizedBox(
              height: h * .02,
            ),
            Text(
              "_aboutClinic".tr,
              style: SignTitles,
            ),
            SizedBox(
              height: h * .02,
            ),
            Text(
              "_aboutClinicField".tr,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
              )),
            ),
            SizedBox(
              height: h * .02,
            ),

            MultiLineTextField(
              controller: aboutClinicController,
            ),

            SizedBox(
              height: h * .02,
            ),
            Text(
              "_numberClinic".tr,
              style: SignTitles,
            ),
            SizedBox(
              height: h * .02,
            ),
            TxtFormField(
              " ",
              TextInputType.phone,
              " ",
              const Icon(Icons.phone_enabled_sharp),
              IconButton(
                icon: const Icon(null),
                onPressed: () {},
              ),
              false,
              clinicPhoneController,
            ),
          ],
        )
        // : const SizedBox(
        //     width: 0,
        //     height: 0,
        //   ),
      ],
    );
  }
}

class HaveClinicen extends StatefulWidget {
  const HaveClinicen({Key? key}) : super(key: key);

  @override
  _HaveClinicenState createState() => _HaveClinicenState();
}

TextEditingController clinicAddControlleren = TextEditingController();
TextEditingController clinicNameControlleren = TextEditingController();
TextEditingController aboutClinicControlleren = TextEditingController();

class _HaveClinicenState extends State<HaveClinicen> {
  Location location = Location();
  bool? _serviceEnabled;
  final bool _isListenLocation = false, _isGetLocation = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  ////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////
  final bool? _haveClinic = false;
  int? groupValue0;

  ValueChanged<int?> _valueChangedHandler() {
    return (value) => setState(() => groupValue0 = value!);
  }
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * .02,
        ),
        // Row(
        //   children: [
        //     MyRadioOption<int>(
        //       value: 1,
        //       groupValue: groupValue0,
        //       onChanged: _valueChangedHandler(),
        //       text: '_yes'.tr,
        //     ),
        //     SizedBox(
        //       width: w * .1,
        //     ),
        //     MyRadioOption<int>(
        //       value: 2,
        //       groupValue: groupValue0,
        //       onChanged: _valueChangedHandler(),
        //       text: '_no'.tr,
        //     ),
        //   ],
        // ),
        // groupValue0 == 1
        //     ?
        Column(
          children: [
            Text(
              "_clinicName".tr,
              style: SignTitles,
            ),
            TxtFormField(
                "_clinicName".tr,
                TextInputType.streetAddress,
                " ",
                const Icon(Icons.place),
                IconButton(
                  icon: const Icon(null),
                  onPressed: () {},
                ),
                false,
                clinicNameControlleren),
            Text(
              "_clinicAdd".tr,
              style: SignTitles,
            ),
            TxtFormField(
                "_clinicAddDetail".tr,
                TextInputType.streetAddress,
                " ",
                const Icon(Icons.place),
                IconButton(
                  icon: const Icon(null),
                  onPressed: () {},
                ),
                false,
                clinicAddControlleren),
            // TextButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (ctx) => AlertDialog(
            //                 backgroundColor:
            //                     Get.isDarkMode ? darkGreyClr : white,
            //                 actionsOverflowDirection:
            //                     VerticalDirection.up,
            //                 actionsAlignment: MainAxisAlignment.start,
            //                 actions: <Widget>[
            //                   Column(
            //                     children: [
            //                       TxtButton(
            //                         txt: "_currentLocation".tr,
            //                         function: ()async {
            //                           _serviceEnabled=await location.serviceEnabled();
            //                           if(!_serviceEnabled!){
            //                             _serviceEnabled=await location.requestService();
            //                             if(_serviceEnabled!) return;
            //                           }
            //                           _permissionGranted=await location.hasPermission();
            //                           if(_permissionGranted == PermissionStatus.denied){
            //                             _permissionGranted=await location.requestPermission();
            //                             if(_permissionGranted!=PermissionStatus.granted) return;
            //                           }
            //                           _locationData=await location.getLocation();
            //                           setState(() {
            //                             _isGetLocation!=true;
            //
            //                           });
            //                           // Get.back();
            //                         },
            //                         color: Get.isDarkMode
            //                             ? white
            //                             : darkGreyClr,
            //                       ),
            //                       _isGetLocation? Text("Location:${_locationData!.latitude}& ${_locationData!.longitude}"):const Text("مش شغال "),
            //                       TxtButton(
            //                         txt: "_otherLocation".tr,
            //                         function: () {
            //                           Get.back();
            //                         },
            //                         color: Get.isDarkMode
            //                             ? white
            //                             : darkGreyClr,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ));
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         const Icon(Icons.add_location_alt),
            //         Text("_addLocation".tr),
            //       ],
            //     )),
            SizedBox(
              height: h * .02,
            ),
            Text(
              "_aboutClinic".tr,
              style: SignTitles,
            ),
            SizedBox(
              height: h * .02,
            ),

            Text(
              "_aboutClinicField".tr,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
              )),
            ),
            SizedBox(
              height: h * .02,
            ),

            MultiLineTextField(
              controller: aboutClinicControlleren,
            ),

            SizedBox(
              height: h * .02,
            ),
          ],
        )
        // : const SizedBox(
        //     width: 0,
        //     height: 0,
        //   ),
      ],
    );
  }
}

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  final bool? _haveClinic = false;
  int? groupValue1;
  TextEditingController hospitalAddController = TextEditingController();
  ValueChanged<int?> _valueChangedHandler() {
    return (value) => setState(() => groupValue1 = value!);
  }
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * .02,
        ),
        Row(
          children: [
            MyRadioOption<int>(
              value: 1,
              groupValue: groupValue1,
              onChanged: _valueChangedHandler(),
              text: '_yes'.tr,
            ),
            SizedBox(
              width: w * .1,
            ),
            MyRadioOption<int>(
              value: 2,
              groupValue: groupValue1,
              onChanged: _valueChangedHandler(),
              text: '_no'.tr,
            ),
          ],
        ),
        groupValue1 == 1
            ? Column(
                children: [
                  Text(
                    "_addHospital".tr,
                    style: SignTitles,
                  ),
                  TxtFormField(
                      "_clinicAddDetail".tr,
                      TextInputType.streetAddress,
                      " ",
                      const Icon(Icons.place),
                      IconButton(
                        icon: const Icon(null),
                        onPressed: () {},
                      ),
                      false,
                      hospitalAddController),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "_examinationFees".tr,
                    style: SignTitles,
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  const ExaminationFees(),
                  SizedBox(
                    height: h * .02,
                  ),
                ],
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
List<String> selectedItemsService = [];

class NurseServices extends StatefulWidget {
  const NurseServices({Key? key}) : super(key: key);

  @override
  State<NurseServices> createState() => _NurseServicesState();
}

class _NurseServicesState extends State<NurseServices> {
  void _showMultiSelect() async {
    // a list of selectable items
    final List<String> _items = [
      'قياس دوري لجميع الوظائف الحيوية مثل (قياس الضغط، قياس السكر، قياس مستوى الأكسجين، قياس درجة الحرارة، قياس مستوى النبض)',
      'سحب العينات لعمل أي تحاليل طبية عوضاً عن ذهاب المريض إلى مركز التحاليل.',
      'تغيير الجروح وتركيب المحاليل والكانيولا',
      'إعطاء العلاج والحقن',
      'تحريك المريض في سريره بشكل دوري',
      'العناية بجلد المريض لحمايته من قرح الفراش',
      'القسطرة',
      'رعاية المريض الذي يستخدم جهاز تنفس صناعي',
      'رعاية المرضى الملازمين للفراش',
      'رعاية حديثي الولادة',
      'مساعدة المريض خارج المنزل',
      'متابعة مرضى الزهايمر',
      'مرضى أنبوب التغذية (feeding tube) أو ثقب جهاز التنفس (tracheostomy)',
      'مساعدة المريض في الرعاية الصحية مثل(دورة المياة – الاستحمام – تغيير الثياب)',
      'مساعدة في تخطيط الوجبات',
      'مراعاة عدم حدوث الخلط الضار للأدوية',
      'إعادة التأهيل بعد العمليات الجراحية',
      ' العلاج بالحقن الوريدية والتنقيط الوريدى في المنزل',
      'رعاية كبار السن',
      'العلاج الطبيعي',
      'رعاية كسور العظام فى المنزل',
      'علاج الجروح العميقة ومنها جروح ما بعد العمليات الجراحية وقرح الفراش والقدم السكري',
      'قياس العلامات الحيوية من تنفس وحرارة وضغط والنبض.',
      'متابعة معدل السوائل التى يتناولها المريض والتي يفقدها.',
      'الإشراف على تغذية المريض ومواعيد دوائه.',
      'تقديم تقييم يومى للطبيب المختص بمعالجة الحالة.',
      'الإشراف العام على الحالة الصحية والنفسية للمريض وتقديم تقرير يومى.',
      'تنظيم مواعيد الطعام والأدوية والإشراف على نوعية الطعام، وايضا اجراء فحص الحساسية للأدوية التى تحتاج إلى ذلك.',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItemsService = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        SizedBox(
          height: h * .1,
          width: w * .95,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: const Color(0xFF387C6D),
              side: const BorderSide(color: darkGreyClr, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '_nurseServices'.tr,
                  style: TextStyle(
                      color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            onPressed: _showMultiSelect,
          ),
        ),
        Divider(
          height: h * .01,
        ),
        // display selected items
        Wrap(
          children: selectedItemsService
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
String? professionalTitleValue;

class NurseProfessionalTittle extends StatefulWidget {
  const NurseProfessionalTittle({Key? key}) : super(key: key);

  @override
  State<NurseProfessionalTittle> createState() =>
      _NurseProfessionalTittleState();
}

class _NurseProfessionalTittleState extends State<NurseProfessionalTittle> {
  List<String> professionalTitleItems = [
    '_registeredNurse'.tr,
    '_nurseTech'.tr,
    '_nurseAid'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      width: w * .95,
      height: h * .1,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: DarkBlue,
            ),
            borderRadius: BorderRadius.circular(.06),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: DarkBlue, width: .9)),
        ),
        validator: (value) => value == null ? "_emptyField".tr : null,
        hint: Text(
          '_notSelected'.tr,
          style: TextStyle(
              color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),

        value: professionalTitleValue,

        icon: const Icon(Icons.keyboard_arrow_down),

        items: professionalTitleItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items, style: SignTitles),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            professionalTitleValue = newValue;
          });
        },
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

TextEditingController AddressController = TextEditingController();
List<String> selectedItemswork = [];

class NurseWorkIn extends StatefulWidget {
  const NurseWorkIn({Key? key}) : super(key: key);

  @override
  State<NurseWorkIn> createState() => _NurseWorkInState();
}

class _NurseWorkInState extends State<NurseWorkIn> {
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      '_hospital'.tr,
      '_clinic'.tr,
      '_lab'.tr,
      '_other'.tr,
      '_noWork'.tr,
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItemswork = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        SizedBox(
          height: h * .1,
          width: w * .95,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.teal,
              side: const BorderSide(color: darkGreyClr, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '_workingPlace'.tr,
                  style: TextStyle(
                      color: Get.isDarkMode ? PrimaryColor : PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            onPressed: _showMultiSelect,
          ),
        ),
        Divider(
          height: h * .02,
        ),
        // display selected items
        Wrap(
          children: selectedItemswork
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        ),
        Text(
          "_workAddress".tr,
          style: SignTitles,
        ),
        TxtFormField(
            "_clinicAddDetail".tr,
            TextInputType.streetAddress,
            " ",
            const Icon(Icons.place),
            IconButton(
              icon: const Icon(null),
              onPressed: () {},
            ),
            false,
            AddressController),
      ],
    );
  }
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
