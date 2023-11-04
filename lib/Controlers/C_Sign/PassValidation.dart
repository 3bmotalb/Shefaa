// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes.dart';

class PassValidation extends StatefulWidget {
  TextEditingController? controller, controller0;

  PassValidation({this.controller, this.controller0, Key? key})
      : super(key: key);

  @override
  State<PassValidation> createState() => PassValidationState();
}

class PassValidationState extends State<PassValidation> {
  // String _password='';
  static String? _confirmPassword;
  static String _password = '';
  static double _strength = 0;

  // static BuildContext? context;

  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  // 1: Great
  static Future<void> passFun(String p1, p2) async {
    if (_strength >= (2 / 4) && (_confirmPassword == _password)
        // &&(_confirmPassword!.length < 8)&&(_password!.length < 8)
        ) {
      _displayText = 'Done';
      // Get.to(const SignIn());
      _password = p1.trim();
      //
      // if (_password.isEmpty) {
      //   setState(() {
      //     _strength = 0;
      //     _displayText = 'Please enter you password';
      //   });
      // }
      // else
      if (_password.length < 6) {
        // setState(() {
        _strength = 1 / 4;
        _displayText = '_shortPass'.tr;
        // });
      } else if (_password.length < 8) {
        // setState(() {
        _strength = 2 / 4;
        // _displayText = 'Your password is acceptable but not strong';
        // });
      } else {
        if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
          // setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = '_strongPass'.tr;
          // });
        } else {
          // Password length >= 8
          // Password contains both letter and digit characters
          // setState(() {
          _strength = 1;
          _displayText = '_greatPass'.tr;
          // });
        }
      }
    }
  }

  static RegExp numReg = RegExp(r".*[0-9].*");
  static RegExp letterReg = RegExp(r".*[A-Za-z].*");

  static String _displayText = ' ';

  bool _isObscure = true;
  bool _isObscure0 = true;

  void _checkPassword(String value) {
    _password = value.trim();
    //
    // if (_password.isEmpty) {
    //   setState(() {
    //     _strength = 0;
    //     _displayText = 'Please enter you password';
    //   });
    // }
    // else
    if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = '_shortPass'.tr;
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        // _displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = '_strongPass'.tr;
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = '_greatPass'.tr;
        });
      }
    }
  }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        TextFormField(
          cursorColor: DarkBlue,
          style: const TextStyle(color: Color(0xFF1D242B)),
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_open,
              color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
            ),
            // labelText: 'Password',
            hintText: "_Pass".tr,
            hintStyle: TextStyle(
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
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
          obscureText: _isObscure,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return ('_emptyField'.tr);
            }
            if (value.trim().length < 8) {
              return '_minPass'.tr;
            }
            // Return null if the entered password is valid
            else {
              return null;
            }
          },
          onChanged: (value) {
            // value=_password;

            _checkPassword(value);
            _password = value;
          },
        ),

        // TextField(
        //   onChanged: (value) => _checkPassword(value),
        //   obscureText: true,
        //   decoration: const InputDecoration(
        //       border: OutlineInputBorder(), hintText: 'Password'),
        // ),
        const SizedBox(
          height: 10,
        ),
        // The strength indicator bar
        LinearProgressIndicator(
          value: _strength,
          backgroundColor: Colors.grey[300],
          color: _strength <= 1 / 4
              ? const Color(0xFFB20600)
              : _strength == 2 / 4
                  ? const Color(0xFFFFD93D)
                  : _strength == 3 / 4
                      ? const Color(0xFF187498)
                      : const Color(0xFF6BCB77),
          minHeight: 12,
        ),
        Text(
          _displayText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),

        /// Confirm Password
        TextFormField(
          cursorColor: DarkBlue,
          style: const TextStyle(color: Color(0xFF1D242B)),
          controller: widget.controller0,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_open,
              color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
            ),
            // labelText: 'Password',
            hintText: "_reEnterPass".tr,
            hintStyle: TextStyle(
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700]),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  _isObscure0 = !_isObscure0;
                });
              },
            ),
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
          obscureText: _isObscure0,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '_emptyField'.tr;
            }
            if (value.trim().length < 8) {
              return '_minPass'.tr;
            }

            // if (value != (_password)) {
            //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     content: Text('Confimation password does not match the entered password'),
            //   ));
            // }
            else {
              return null;
            }
          },
          onChanged: (value) => _confirmPassword = value,
        ),

        // This button will be enabled if the password strength is medium or beyond
        // ElevatedButton(
        //     onPressed: () {
        //       if (_strength >= (2 / 4) && (_confirmPassword == _password)
        //           // &&(_confirmPassword!.length < 8)&&(_password!.length < 8)
        //           ) {
        //         _displayText =
        //             'Confirmation password does not match the entered password';
        //         // Get.to(const SignIn());
        //       } else {
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //           content: Text(
        //               'Confirmation password does not match the entered password'),
        //         ));
        //       }
        //     },
        //     //
        //     // _strength < 1 / 2 ? null : () {
        //     //
        //     //   Get.to(SignIn());
        //     // },
        //     child: const Text('Continue'))
      ],
    );
  }
// void _trySubmitForm() {
//   final bool? isValid = _formKey.currentState?.validate();
//   if (isValid == true) {
//     debugPrint('Everything looks good!');
//     debugPrint(_password);
//     debugPrint(_confirmPassword);
//
//     /*
//    Continute proccessing the provided information with your own logic
//    such us sending HTTP requests, savaing to SQLite database, etc.
//    */
//   }
// }
}
