import 'package:flutter/material.dart';
import '../constants.dart';

class DisabledTextFields extends StatefulWidget {
  final String value;
  final IconData prefixIcon;
  const DisabledTextFields(
      {Key? key,
        required this.prefixIcon,
        required this.value
        })
      : super(key: key);

  @override
  _DisabledTextFieldsState createState() => _DisabledTextFieldsState();
}

class _DisabledTextFieldsState extends State<DisabledTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        enabled: false,
        initialValue: widget.value,
        cursorColor: primaryColor,
        style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
        decoration: InputDecoration(
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
            color: primaryColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
