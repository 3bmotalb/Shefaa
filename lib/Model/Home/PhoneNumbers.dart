// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../themes.dart';

final TextEditingController controller = TextEditingController();
String initialCountry = 'EG';
PhoneNumber isocode = PhoneNumber(isoCode: 'EG');

Widget phonenumber({
  required Function(PhoneNumber number) onsaved,
}) =>
    InternationalPhoneNumberInput(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("_phoneRequired".tr);
        } else if (value.length != 10) {
          return ("_phonedigets".tr);
        } else if (value.startsWith('0')) {
          return ("_phoneNoZero".tr);
        } else {
          return null;
        }
      },
      inputDecoration: InputDecoration(
        hintText: "_phoneNumber".tr,
        hintStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
            fontSize: 15),
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

      onInputChanged: (PhoneNumber number) {
        // print(number);
      },

      onInputValidated: (bool value) {},
      textAlign: TextAlign.left,

      selectorConfig: const SelectorConfig(
        leadingPadding: 5,
        useEmoji: true,
        trailingSpace: false,
        setSelectorButtonAsPrefixIcon: false,
        selectorType: PhoneInputSelectorType.DIALOG,
      ),

      ignoreBlank: false,

      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      searchBoxDecoration: InputDecoration(
        hintText: "_selectYourCountry",
        hintStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[700] : white, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.9,
            color: SecondColor,
          ),
          borderRadius: BorderRadius.circular(.06),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: LightGrey, width: .9)),
      ),
      spaceBetweenSelectorAndTextField: 2,
      // selectorButtonOnErrorPadding: 2,
      initialValue: isocode,
      formatInput: false,
      maxLength: 10,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      // inputBorder:  OutlineInputBorder(
      //     borderSide: BorderSide(color: DarkBlue, width: .9)),
      //

      textStyle: const TextStyle(color: Color(0xFF1D242B)),
      cursorColor: DarkBlue,
      // spaceBetweenSelectorAndTextField: .6,

      onSaved: onsaved,
    );
