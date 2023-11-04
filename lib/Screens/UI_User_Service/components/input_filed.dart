import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class inputfiled extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? multilines;
  const inputfiled(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.multilines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              fontSize: 16,
            )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  keyboardType: multilines == null
                      ? TextInputType.text
                      : TextInputType.multiline,
                  maxLines: 4,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  controller: controller,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  )),
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      )),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      )),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ))),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
