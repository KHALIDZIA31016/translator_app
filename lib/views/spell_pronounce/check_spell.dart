import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mnh/utils/app_images.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';

import '../../utils/app_icons.dart';
import '../../widgets/copy_btn.dart';
import '../../widgets/custom_mic.dart';
import '../../widgets/custom_textBtn.dart';
import '../../widgets/delete_btn.dart';
import '../../widgets/dropDown_btn.dart';
import '../../widgets/share_btn.dart';
import '../../widgets/text_widget.dart';

class CheckSpellScreen extends StatefulWidget {
  const CheckSpellScreen({super.key});

  @override
  State<CheckSpellScreen> createState() => _CheckSpellScreenState();
}

class _CheckSpellScreenState extends State<CheckSpellScreen> {
  final TextEditingController _textController = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();

  String _selectedValue = 'Eng';
  final Map<String, String> _languageCodes = {
    'Eng': 'en-US',
    'Spanish': 'es-ES',
    'Turkish': 'tr-TR',
    'Arabic': 'ar-SA',
    'Hindi': 'hi-IN',
  };
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _flutterTts.setLanguage('en-US');
      _showWelcomeDialog();
    });
  }

  Future<void> _speak() async {
    String textToSpeak = _textController.text.trim();
    if (textToSpeak.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter text to read aloud.")),
      );
      return;
    }
    String? languageCode = _languageCodes[_selectedValue];
    if (languageCode != null) {
      await _flutterTts.setLanguage(languageCode);
      await _flutterTts.speak(textToSpeak);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selected language is not supported.")),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _flutterTts.stop();
    super.dispose();
  }
  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to proceed to the Spell Check Screen?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Navigate back to the previous screen
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog and proceed
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: regularText(
          title: 'Spell Check',
          textColor: Colors.indigo,
          textWeight: FontWeight.bold,
          textSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal:  screenWidth * 0.02, vertical: screenHeight * 0.02),
              height: 380, width: screenWidth * 0.98,color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      2.asWidthBox,
                      Image.asset(AppImages.UKFlag, scale: 20,),
                      DropdownBtn(
                        selectedValue: _selectedValue,
                        dropdownItems: ['Eng', 'Spanish', 'Turkish', 'Arabic', 'Hindi'],
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue ?? 'Eng'; // Handle value change
                          });
                        },
                      ),
                      Spacer(),
                      CopyBtn(controller:  _textController),
                      ShareBtn(controller: _textController),
                      DeleteBtn(controller:  _textController),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText: 'Type here',
                          border: InputBorder.none
                      ),
                    ),
                  ),
        
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: screenWidth * 0.003,
                    children: [
                      CustomMic(),
                      7.asWidthBox,
                      CustomTextBtn(
                        height: 50,
                        width: 200,
                        textTitle: 'Spell Check',
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                            color: Colors.indigo
                        ),
                        onTap: _speak,
                      ),
                    ],
                  ),
                  10.asHeightBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
