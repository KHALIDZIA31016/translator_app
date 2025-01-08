// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
// class CopyBtn extends StatefulWidget {
//   const CopyBtn({super.key});
//
//   @override
//   State<CopyBtn> createState() => _CopyBtnState();
// }
//
// class _CopyBtnState extends State<CopyBtn> {
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return  IconButton(
//       onPressed: () {
//         Clipboard.setData(
//           ClipboardData(text: _textController.text),
//         );
//       },
//       icon: Icon(
//         Icons.copy,
//         color: Colors.blueGrey,
//       ),
//     );
//   }
// }

/// see the difference

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyBtn extends StatelessWidget {
  final TextEditingController controller;

  const CopyBtn({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return IconButton(
      onPressed: () {
        Clipboard.setData(
          ClipboardData(text: controller.text),
        ).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Text copied to clipboard')),
          );
        });
      },
      icon: Icon(
        Icons.copy,
        color: Colors.blueGrey,
        size: screenWidth * 0.05,
      ),
    );
  }
}

