import 'package:flutter/material.dart';
import 'package:mnh/views/spell_pronounce/spell_pronounce.dart';
import 'package:mnh/views/splash_screen/splash_screen.dart';
import 'package:mnh/widgets/animated_mic.dart';


void main(){
  runApp(VoiceAssistance());
}


class VoiceAssistance extends StatefulWidget {
  const VoiceAssistance({super.key});

  @override
  State<VoiceAssistance> createState() => _VoiceAssistanceState();
}

class _VoiceAssistanceState extends State<VoiceAssistance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: MaterialApp(
        locale: Locale('en'),
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],

        debugShowCheckedModeBanner: false,
        home: SpellPronounce(),
      ),
    );
  }
}
