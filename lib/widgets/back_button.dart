import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color btnColor;
  CustomBackButton({required this.onPressed, required this.icon, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),  // Icon passed as parameter
      onPressed: onPressed,  // onPressed action passed as parameter
      color: btnColor,
    );
  }
}
