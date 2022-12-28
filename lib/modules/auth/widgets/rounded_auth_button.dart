import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/values/text_styles.dart';

class RoundedCornerButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onClick;
  final Color? borderColor;

  RoundedCornerButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.onClick,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(17.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(color: borderColor ?? buttonColor))),
          elevation: MaterialStateProperty.all(3.0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: whiteText16.copyWith(
              color: textColor, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
        this.onClick();
      },
    );
  }
}
