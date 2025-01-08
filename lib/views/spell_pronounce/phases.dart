import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mnh/catagory_screen.dart';
import 'package:mnh/utils/app_icons.dart';
import 'package:mnh/utils/app_images.dart';
import 'package:mnh/widgets/back_button.dart';
import 'package:mnh/widgets/custom_tile.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';
import 'package:mnh/widgets/text_widget.dart';

class PhrasesScreen extends StatefulWidget {
  const PhrasesScreen({super.key});

  @override
  State<PhrasesScreen> createState() => _PhrasesScreenState();
}

class _PhrasesScreenState extends State<PhrasesScreen> {
  String _selectedValue = 'Eng';
  String selectedCountry = 'Eng';

  final List<String> tileTitle = [
    'General',
        'Travelling',
        'In the Market',
        'Meal time',
        'Time & Date',
        'In Hospital',
        'Technology',
        'On Airport',
  ];
  final List<String> tileSubTitle = [
    'General',
            'De viae',
            'en al mercando',
            'timepos de comida',
            'hora y fecha',
            'en el hospital',
            'Technologia',
            'el el Airport',
  ];
  final List<String> leadingIcons = [
    AppImages.genIcon,
    AppImages.travellingIcon,
    AppImages.shopIcon,
    AppImages.mealIcon,
    AppImages.dateIcon,
    AppImages.hospitalIcon,
    AppImages.techIcon,
    AppImages.planeIcon,
  ];
  final List<Map<String, dynamic>> phrasesCategories = [
    {"name": "General", "catID": 01,},
    {"name": "Travel", "catID": 02},
    {"name": "Market", "catID": 03},
    {"name": "Meal Time", "catID": 04},
    {"name": "time & date", "catID": 05},
    {"name": "Hospital", "catID": 06},
    {"name": "Technology", "catID": 07},
    {"name": "Airport", "catID": 08},
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CustomBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back_ios,
          btnColor: Colors.indigo,
        ),
        title: regularText(
          title: 'Phases',
          textColor: Colors.indigo,
          textWeight: FontWeight.bold,
          textSize: 18,
        ),
      ),
      body: Column(
        children: [
          10.asHeightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth * 0.38,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple,
                ),
                child: Row(
                  children: [
                    10.asWidthBox,
                    Image.asset(
                      AppImages.UKFlag,
                      scale: 20,
                      // color: Colors.white,
                    ),
                    10.asWidthBox,
                    Row(
                      children: [
                        (screenWidth * 0.02).asWidthBox,
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showSearch: false,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country.name; // Update selected country
                                });
                              },
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight: 600,
                                bottomSheetWidth: screenWidth * 1.8,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8C98A8).withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: screenWidth * 0.12,
                            child: Text(
                              selectedCountry,
                              overflow: TextOverflow.ellipsis, // Display the selected country
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        (screenWidth * 0.01).asWidthBox,
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showSearch: false,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country.name; // Update selected country
                                });
                              },
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight: 600,
                                bottomSheetWidth: screenWidth * 1.8,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8C98A8).withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              18.asWidthBox,
              Image.asset(AppIcons.convertIcon, scale: 28),
              18.asWidthBox,
              Container(
                width: screenWidth * 0.38,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple,
                ),
                child: Row(
                  children: [
                    10.asWidthBox,
                    Row(
                      children: [
                        (screenWidth * 0.02).asWidthBox,
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showSearch: false,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country.name; // Update selected country
                                });
                              },
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight: 600,
                                bottomSheetWidth: screenWidth * 1.8,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8C98A8).withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: screenWidth * 0.12,
                            child: Text(
                              selectedCountry,
                              overflow: TextOverflow.ellipsis, // Display the selected country
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        (screenWidth * 0.01).asWidthBox,
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showSearch: false,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry = country.name; // Update selected country
                                });
                              },
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight: 600,
                                bottomSheetWidth: screenWidth * 1.8,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8C98A8).withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,),
                        ),
                      ],
                    ),
                    25.asWidthBox,
                    Image.asset(
                      AppImages.UKFlag,
                      scale: 20,
                      // color: Colors.white,
                    ),
                  ],
                ),
              ),


            ],
          ),
          
          Expanded(
            child: ListView.builder(
                itemCount: tileTitle.length,
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.green)
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasesCategoryScreen(
                        name: phrasesCategories[index]["name"],
                        id:   phrasesCategories[index]["catID"],
                      )),
                      );
                    },
                    child: ListTile(
                      title: Text(phrasesCategories[index]["name"]),
                      subtitle: Text(tileSubTitle[index]),
                      leading: Image.asset(leadingIcons[index], scale: 16,),
                      // tileColor: Colors.grey,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      )
    );
  }
}
