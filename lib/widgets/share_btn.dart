// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
//
//
// class ShareBtn extends StatefulWidget {
//   final TextEditingController controller;
//   const ShareBtn({super.key, required this.controller});
//
//   @override
//   State<ShareBtn> createState() => _ShareBtnState();
// }
//
// class _ShareBtnState extends State<ShareBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         final text = controller.text.trim();
//         if (text.isNotEmpty) {
//           Share.share(text);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('No text to share!'),
//             ),
//           );
//         }
//       },
//       icon: Icon(
//         Icons.share,
//         color: Colors.blueGrey,
//       ),
//     );
//   }
// }

/// see the difference



import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareBtn extends StatelessWidget {
  final TextEditingController controller;

  const ShareBtn({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return IconButton(
      onPressed: () {
        final text = controller.text.trim(); // Trim whitespace for cleaner sharing
        if (text.isNotEmpty) {
          Share.share(text);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No text to share!'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      icon: Icon(
        Icons.share,
        color: Colors.blueGrey,
        size: screenWidth * 0.05,
      ),
    );
  }
}
