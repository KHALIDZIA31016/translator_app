import 'package:flutter/material.dart';

import '../utils/app_icons.dart';

class CustomMic extends StatelessWidget {
  const CustomMic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Mic is not working properly'),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          )
        );
      },
      child: Container(
        height: 50, width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            color: Colors.indigo
        ),
        child: Image.asset(AppIcons.micIcon, color: Colors.white,scale: 23,),
      ),
    );
  }
}