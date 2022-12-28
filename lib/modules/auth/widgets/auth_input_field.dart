import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;
  final Color color;
  final double fontSize;
  final double iconSize;
  final bool password;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final Function(bool?)? focusCallBack;
  final bool? isFocused;

  AuthInputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hint = '',
    this.color = Colors.grey,
    this.fontSize = 16.0,
    this.password = false,
    this.iconSize = 20,
    this.iconData,
    this.focusCallBack,
    this.isFocused = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) => focusCallBack!(focus),
        child: TextFormField(
          decoration: InputDecoration(
              fillColor: isFocused! ? Color(0x51E8F8E0) : Color(0x44E5E5E5),
              contentPadding: EdgeInsets.symmetric(vertical: 18.0),
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
              prefixIcon: iconData != null
                  ? Icon(
                      iconData,
                      size: iconSize,
                      color: isFocused! ? Colors.green : Colors.grey[800],
                    )
                  : null),
          controller: this.controller,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
          keyboardType: this.keyboardType,
          obscureText: this.password,
          autocorrect: false,
          validator: this.validator,
        ),
      ),
    );
  }
}
