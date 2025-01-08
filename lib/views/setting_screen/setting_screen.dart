import 'package:flutter/material.dart';
import 'package:mnh/utils/app_icons.dart';
import 'package:mnh/views/setting_screen/screens/chat_support.dart';
import 'package:mnh/views/setting_screen/screens/privacy_policy.dart';
import 'package:mnh/views/setting_screen/screens/rate_us.dart';
import 'package:mnh/views/setting_screen/screens/remove_ads.dart';
import 'package:mnh/views/setting_screen/screens/share.dart';
import 'package:mnh/views/setting_screen/screens/spell_pro.dart';
import 'package:mnh/views/setting_screen/screens/term_services.dart';
import '../../widgets/text_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  final List<String> tileTitle = [
    'Remove Ads',
    'Customer Support',
    'Rate US',
    'Share',
    'Privacy Policy',
    'Term Of Services',
    'Spell and Pronounce'
  ];
  final List<String> tileSubTitle = [
    'Remove all ads within the app',
    'Tell us what changes you\'d like to see, or bug you\'ve discovered.',
     'Do you like this app? Please support it with 5 star',
    'Do you want to share this app with your friends?',
    'Read the privacy policy',
    'Read the term and services',
    "Version 5.1.0"
  ];
  final List<String> leadingIcons = [
    AppIcons.adsIcon,
    AppIcons.supportIcon,
    AppIcons.thumbIcon,
    AppIcons.shareIcon,
    AppIcons.policyIcon,
    AppIcons.pageIcon,
    AppIcons.IeeIcon,
  ];
  final List<Widget> screens = [
    RemoveAdsScreen(),
    ChatSupportScreen(),
    RateUsScreen(),
    ShareScreen(),
    PrivacyPolicyscreen(),
    TermOfServiceScreen(),
    SpellAndProScreen(),
  ];
  final List<Map<String, dynamic>> categoriesSetting = [
    {"name": "Remove Ads", "catID": 01,},
    {"name": "Customer Support", "catID": 02},
    {"name": "Rate Us", "catID": 03},
    {"name": "Share ", "catID": 04},
    {"name": "Privacy Policy", "catID": 05},
    {"name": "Term of Services", "catID": 06},
    {"name": "Spell and Pronounce", "catID": 07},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: regularText(
          title: 'Setting Screen',
          textColor: Colors.black,
          textSize: 18,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
      Flexible(
      child: ListView.builder(
      itemCount: tileTitle.length,
        itemBuilder: (context, index) {
          return Container(
              height: 70, width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.white,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> screens[index] ));
                },
                child: ListTile(
                  leading: Image.asset(leadingIcons[index], scale: 20, color: Colors.blue,),
                  title: Text(tileTitle[index]),
                  subtitle: Text(tileSubTitle[index] ?? ''),
                ),
              )
          );
        },),
    )
        ],
      ),
    );
  }
}
