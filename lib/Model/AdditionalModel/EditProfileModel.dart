// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:graduation_project/Model/Home/textFormField.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../themes.dart';
import '../Home/DateField.dart';
import '../Home/PhoneNumbers.dart';

class EditProfileModel extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var store;
  EditProfileModel({Key? key, required this.store}) : super(key: key);

  @override
  State<EditProfileModel> createState() => _EditProfileModelState();
}

class _EditProfileModelState extends State<EditProfileModel> {
  bool? editName = false;
  bool? editfullName = false;
  bool? editMail = false;
  bool? editID = false;
  late PhoneNumber phoneNumber;
  TextEditingController nameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  bool editPhone = false;
  DateTime? birthdate;

  bool editDate = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ///////////=======================================///////////
        editName == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.person,
                    txt: widget.store!.firstName! +
                        ' ' +
                        widget.store!.lastName!,
                    function: () {
                      setState(() {
                        editName = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: TxtFormField(
                    widget.store!.firstName! + ' ' + widget.store!.lastName!,
                    TextInputType.name,
                    "",
                    Icon(Icons.person,
                        color: Get.isDarkMode
                            ? Colors.grey[700]
                            : Colors.grey[700]),
                    IconButton(
                      icon: const Icon(null),
                      onPressed: () {},
                    ),
                    false,
                    nameController)),
        ///////////=======================================///////////

        ///////////=======================================///////////

        editfullName == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.person,
                    txt: "EditFullName",
                    function: () {
                      setState(() {
                        editfullName = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: TxtFormField(
                    "$fullNameController",
                    TextInputType.name,
                    "",
                    Icon(Icons.person,
                        color: Get.isDarkMode
                            ? Colors.grey[700]
                            : Colors.grey[700]),
                    IconButton(
                      icon: const Icon(null),
                      onPressed: () {},
                    ),
                    false,
                    fullNameController)),
        ///////////=======================================///////////
        ///////////=======================================///////////

        editMail == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.mail,
                    txt: widget.store!.email!,
                    function: () {
                      setState(() {
                        editMail = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: TextFormField(
                  cursorColor: DarkBlue,
                  style: const TextStyle(color: Color(0xFF1D242B)),
                  controller: mailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("_emptyField".tr);
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return '_validEmail'.tr;
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color:
                          Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
                    ),
                    // prefixIconColor:Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
                    // suffixIconColor:Get.isDarkMode ? Colors.grey[700] :Colors.grey[700],
                    hintText: "_email".tr,
                    hintStyle: TextStyle(
                        color: Get.isDarkMode
                            ? Colors.grey[700]
                            : Colors.grey[700]),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.9,
                        color: Color(0xFF324E7B),
                      ),
                      borderRadius: BorderRadius.circular(w * .06),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: DarkBlue, width: .9)),
                  ),
                ),
              ),

        ///////////=======================================///////////
        editID == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.card_membership_outlined,
                    txt: "EDit ID",
                    function: () {
                      setState(() {
                        editID = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: TxtFormField(
                    "Edit ID",
                    TextInputType.number,
                    "",
                    Icon(Icons.card_membership,
                        color: Get.isDarkMode
                            ? Colors.grey[700]
                            : Colors.grey[700]),
                    IconButton(
                      icon: const Icon(null),
                      onPressed: () {},
                    ),
                    false,
                    idController)),
        ///////////=======================================///////////
        ///////////=======================================///////////
        editPhone == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.phone,
                    txt: widget.store!.phone1,
                    function: () {
                      setState(() {
                        editPhone = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: phonenumber(onsaved: (PhoneNumber number) {
                  phoneNumber = number;
                }),
              ),
        ///////////=======================================///////////
        ///////////=======================================///////////
        editDate == false
            ? Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .09,
                width: w * .9,
                child: _displayProfileData(
                    icon: Icons.calendar_today_rounded,
                    txt: widget.store!.birthdate!,
                    function: () {
                      setState(() {
                        editDate = true;
                      });
                    }))
            : Container(
                margin: EdgeInsets.symmetric(vertical: h * .01),
                height: h * .13,
                width: w * .9,
                child: Card(
                  color: Get.isDarkMode
                      ? const Color(0xFFFAF9F9)
                      : const Color(0xFFFAF9F9),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(w * .04), // if you need this
                    side: const BorderSide(
                      // color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Datepicker(
                    onsaved: (time) {
                      birthdate = time;
                    },
                  ),
                )),
        ///////////=======================================///////////
      ],
    );
  }

  _editProfile({IconData? icon, String? txt}) {
    return ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
            Text(
              txt!,
              style: const TextStyle(fontSize: 20),
            ),
            const Icon(Icons.arrow_forward_ios_sharp),
          ],
        ));
  }

  _displayProfileData({IconData? icon, String? txt, Callback? function}) {
    return OutlinedButton(
        onPressed:

            // edit = true;
            function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
            Text(
              txt!,
              style: const TextStyle(color: Color(0xFF1D242B)),
            ),
            Icon(Icons.arrow_forward_ios_sharp,
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
          ],
        ));
  }
}
// class showData extends StatelessWidget {
//   IconData ?icon;
//   String? txt;
//    showData({Key? key,this.icon,this.txt}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       height: h*.1,
//       width: w*.9,
//       child: OutlinedButton(
//           onPressed: (){
//
//
//           },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(icon),
//                 Text(txt!,style: TextStyle(fontSize: 20),),
//                 const Icon(Icons.arrow_forward_ios_sharp),
//
//               ],
//             )
//         ),
//     );
//     }
//   }
// class editData extends StatelessWidget {
//    ?icon;
//   String? txt;
