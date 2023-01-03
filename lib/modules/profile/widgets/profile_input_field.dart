import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;
  final Color color;
  final double fontSize;
  final double iconSize;
  final IconData? iconData;
  final String? Function(String?)? validator;

  ProfileInputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hint = '',
    this.color = Colors.grey,
    this.fontSize = 16.0,
    this.iconSize = 20,
    this.iconData,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Color(0x44E5E5E5),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(15.0)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: this.hint,
            hintStyle: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: FontWeight.normal,
            ),
            filled: true,
            isDense: true,
            suffixIcon: iconData != null
                ? Icon(
                    iconData,
                    size: iconSize,
                    color: Colors.grey[500],
                  )
                : null),
        controller: this.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        keyboardType: this.keyboardType,
        autocorrect: false,
        validator: this.validator,
      ),
    );
  }
}
