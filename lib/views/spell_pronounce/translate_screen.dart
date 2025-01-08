import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mnh/widgets/back_button.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';

import '../../utils/app_icons.dart';
import '../../utils/app_images.dart';
import '../../widgets/animated_mic.dart';
import '../../widgets/copy_btn.dart';
import '../../widgets/custom_mic.dart';
import '../../widgets/custom_textAnalyzer.dart';
import '../../widgets/custom_textBtn.dart';
import '../../widgets/delete_btn.dart';
import '../../widgets/dropDown_btn.dart';
import '../../widgets/lang_selection.dart';
import '../../widgets/share_btn.dart';
import '../../widgets/text_widget.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final TextEditingController _textController = TextEditingController();
  String selectedCountry = "Eng"; // Default text for the button

  String _selectedValue = 'Eng'; // Changed from String? to String to avoid null issues

  final List<String> _dropdownItems = [
    'Eng',
    'Spanish',
    'Turkish',
    'Arabic',
    'Hindi',
  ];
  final FlutterTts _flutterTts = FlutterTts();

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
      _flutterTts.setLanguage('en-US'); // Default language
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back_ios_outlined,
          btnColor: Colors.indigo,
        ),
        backgroundColor: Colors.white,
        title: regularText(
          title: 'Translator',
          textColor: Colors.indigo,
          textWeight: FontWeight.bold,
          textSize: screenWidth * 0.046,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: screenHeight * 0.014,
            children: [
              3.asHeightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LeftLangBox(),
                  (screenWidth * 0.03).asWidthBox,
                  Image.asset(AppIcons.convertIcon, scale: 28, color: Colors.indigo,),
                  (screenWidth * 0.032).asWidthBox,
                  RightLangBox(),

                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                height: 380,
                width: screenWidth * 0.98,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: screenWidth * 0.012,
                      children: [
                        2.asWidthBox,
                        Image.asset(AppImages.UKFlag, scale: screenWidth * 0.044),
                        LangSelection(),
                        Spacer(),
                        CopyBtn(controller: _textController),
                        ShareBtn(controller: _textController),
                        DeleteBtn(controller: _textController),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Type here',
                          border: InputBorder.none,
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
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.52,
                          textTitle: 'Translate',
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
      ),
    );
  }
}
