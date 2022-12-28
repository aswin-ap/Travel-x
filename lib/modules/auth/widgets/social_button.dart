import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/utils/values/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String image;

  SocialButton({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightWhite)),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
        width: 30,
        height: 30,
      ),
    );
  }
}
