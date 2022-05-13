import 'package:flutter/material.dart';
import '../constants.dart';

class TextFields extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType type;
  final IconData prefixIcon;
  final bool obscureText;
  final String hintText;
  const TextFields(
      {Key? key,
      required this.title,
      required this.controller,
      required this.type,
      required this.prefixIcon,
      this.obscureText = false,
      required this.hintText})
      : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter ${widget.title}";
              }
            },
            obscureText: widget.obscureText,
            controller: widget.controller,
            cursorColor: primaryColor,
            keyboardType: widget.type,
            style: const TextStyle(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusColor: primaryColor,
              // enabledBorder: UnderlineInputBorder(
              //   borderSide:  BorderSide(color: primaryColor),
              // ),
              prefixIcon: Icon(
                widget.prefixIcon,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
