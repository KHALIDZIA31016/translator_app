import 'package:flutter/material.dart';
import 'package:mnh/widgets/text_widget.dart';


class CustomTextBtn extends StatelessWidget {
  final double height;
  final double width;
  VoidCallback? onTap;
  final String textTitle;
  final Decoration? decoration;


  CustomTextBtn({
    super.key,
    this.onTap,
    required this.textTitle,
    this.decoration,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height, width: width,
        decoration: decoration,
        child: Center(child: regularText(title: textTitle, textSize: 18, textColor: Colors.white)),
      ),
    );
  }
}