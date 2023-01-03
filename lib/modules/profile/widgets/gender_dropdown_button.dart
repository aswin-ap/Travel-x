import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../../utils/values/text_styles.dart';

///Utility class for profile dropdown button
class GenderDropDownButton extends StatefulWidget {
  final List<String> items;
  final double height;
  final String currentValue;
  final Function(String) selectedItem;

  const GenderDropDownButton(
      {Key? key,
      required this.items,
      required this.height,
      required this.currentValue,
      required this.selectedItem})
      : super(key: key);

  @override
  State<GenderDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<GenderDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        decoration: ShapeDecoration(
          color: Color(0x44E5E5E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        width: double.infinity,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            hint: DropdownMenuItem(
              child: Text(
                'Select',
                style: whiteText16.copyWith(color: Colors.black),
                textScaleFactor: 1.0,
              ),
            ),
            dropdownColor: Colors.white,
            iconEnabledColor: Colors.black,
            menuMaxHeight: SizeConfig().screenHeight * 0.4,
            iconSize: SizeConfig().screenHeight * 0.04,
            selectedItemBuilder: (BuildContext context) {
              return widget.items.map((String value) {
                return Container(
                  child: DropdownMenuItem(
                    child: Text(
                      widget.currentValue,
                      style: whiteText16.copyWith(color: Colors.black),
                      textScaleFactor: 1.0,
                    ),
                  ),
                );
              }).toList();
            },
            value: widget.currentValue == 'null' ? null : widget.currentValue,
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0x44E5E5E5),
                        border: Border(
                            bottom: widget.items.last == value
                                ? BorderSide.none
                                : BorderSide(width: 1.0, color: Colors.grey))),
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        value,
                        style: whiteText16.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ));
            }).toList(),
            isExpanded: true,
            onChanged: (item) {
              widget.selectedItem(item!);
            },
            elevation: 0,
          ),
        ));
  }
}
