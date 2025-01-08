import 'package:flutter/material.dart';
import 'package:mnh/utils/app_icons.dart';
import 'package:mnh/views/languages/languages.dart';
import 'package:mnh/views/spell_pronounce/check_spell.dart';
import 'package:mnh/views/spell_pronounce/dictionary.dart';
import 'package:mnh/views/spell_pronounce/phases.dart';
import 'package:mnh/views/spell_pronounce/pronunciation_screen.dart';
import 'package:mnh/views/spell_pronounce/translate_screen.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';
import '../../widgets/text_widget.dart';
import '../setting_screen/setting_screen.dart';

class SpellPronounce extends StatefulWidget {
  const SpellPronounce({super.key});

  @override
  State<SpellPronounce> createState() => _SpellPronounceState();
}

class _SpellPronounceState extends State<SpellPronounce> {
  bool _isMenuOpen = false;

  final List<String> title = [
    'Spell Checker',
    'Translator',
    'Dictionary',
    'Phrases',
  ];

  final List<Widget> screens = [
    CheckSpellScreen(),
    TranslatorScreen(),
    DictionaryScreen(),
    PhrasesScreen(),
  ];

  final List<double> iconSize = [1.0, 2.0, 2.0, 1.0 ];

  final List<String> icons = [
    AppIcons.spellIcon,
    AppIcons.transIcon,
    AppIcons.dicIcon,
    AppIcons.phraseIcon,
  ];

  final List<Color> tileColor = [
    Colors.blue.shade400,
    Colors.indigo.shade400,
    Colors.purple.shade400,
    Colors.deepOrange.shade400
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: regularText(
          title: 'Spell and Pronounce',
          textColor: Colors.black,
          textSize: screenWidth * 0.042,
          textWeight: FontWeight.w500
        ),
        actions: [

          Icon(Icons.thumb_up_off_alt, color: Colors.blueGrey),
          6.asWidthBox,
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              showMenu<int>(
                context: context,
                clipBehavior: Clip.none,
                // constraints: BoxConstraints(minWidth: 100),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                position: RelativeRect.fromLTRB(
                  details.globalPosition.dx + 0, // X position (from left)
                  details.globalPosition.dy + -10, // Y position (from top with offset)
                  MediaQuery.of(context).size.width - details.globalPosition.dx + 30, // From right
                  20, // Bottom
                ),
                items: [
                  PopupMenuItem<int>(
                    value: 1,
                    child: SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppIcons.transIcon, scale: 1.85, color: Colors.blue,),
                          10.asWidthBox,
                          regularText(title: 'Language', textColor: Colors.black, textSize: 16, textWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                    onTap: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LanguagesScreen()),
                        );
                      });
                    },
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppIcons.settingIcon, scale: 26, color: Colors.blue,),
                          20.asWidthBox,
                          regularText(title: 'Settings', textColor: Colors.black, textSize: 16, textWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                    onTap: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingScreen()),
                        );
                      });
                    },
                  ),
                ],
              );
            },
            child: Icon(Icons.more_vert, color: Colors.blueGrey),
          ),
          10.asWidthBox,
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PronunciationScreen()));
            },
            child: Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.92,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  border: Border.all(color: Colors.blueGrey, width: 2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.announceIcon, color: Colors.white, scale: screenWidth * 0.044,),
                  18.asWidthBox,
                  regularText(
                      title: 'Pronunciation',
                      textSize: screenWidth * 0.042,
                      textColor: Colors.white),
                ],
              ),
            ),
          ),
          25.asHeightBox,
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
              itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 9/4,
                  mainAxisSpacing: screenWidth * 0.05,
                  crossAxisSpacing: screenWidth * 0.05,
                ), itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: tileColor[index],
                          borderRadius: BorderRadius.circular(screenWidth * 0.034),
                        border: Border.all(color: Colors.blueGrey, width: 2)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            icons[index],
                            color: Colors.white,
                            scale: iconSize[index],
                            errorBuilder: (context, error, stackTrace) {
                              print("Error loading asset: ${icons[index]}");
                              return Icon(Icons.error, color: Colors.red);
                            },
                          ),
                          10.asWidthBox,
                          regularText(
                              title: title[index].toString(),
                              textSize: screenWidth * 0.04,
                              textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                  },),
          )
        ],
      ),
    );
  }
}





