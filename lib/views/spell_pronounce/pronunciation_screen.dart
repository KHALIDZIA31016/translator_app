import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mnh/widgets/copy_btn.dart';
import 'package:mnh/widgets/delete_btn.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';
import 'package:mnh/widgets/share_btn.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_images.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_mic.dart';
import '../../widgets/custom_textBtn.dart';
import '../../widgets/dropDown_btn.dart';
import '../../widgets/lang_selection.dart';
import '../../widgets/text_widget.dart';

class PronunciationScreen extends StatefulWidget {
  const PronunciationScreen({super.key});

  @override
  State<PronunciationScreen> createState() => _PronunciationScreenState();
}

class _PronunciationScreenState extends State<PronunciationScreen> {
  final TextEditingController _textController = TextEditingController();
///
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
    // Ensure the plugin is initialized after the widget build.
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
  ///




  // String _selectedValue = 'Eng';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  CustomBackButton(
          btnColor: Colors.indigo,
          icon: Icons.arrow_back_ios,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: regularText(
          title: 'Pronunciation',
          textColor: Colors.indigo,
          textSize: screenWidth * 0.043,
          textWeight: FontWeight.bold

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: screenWidth * 0.001,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal:  screenWidth * 0.02, vertical: screenHeight * 0.02),
              height: screenHeight *  0.45, width: screenWidth * 0.98,
              color: Colors.white,
              child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    2.asWidthBox,
                    Image.asset(AppImages.UKFlag, scale: 20,),
                    12.asWidthBox,
                    LangSelection(),
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
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.52,
                      textTitle: 'Pronounce',
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
            )
          ],
        ),
      ),
    );
  }
}









