// Create an input widget that takes only one digit
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 70,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).canvasColor,
        decoration: InputDecoration(
          fillColor: Color(0x44E5E5E5),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0)),
          filled: true,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
