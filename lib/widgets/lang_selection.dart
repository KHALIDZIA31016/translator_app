import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';

import '../utils/app_icons.dart';


class LangSelection extends StatefulWidget {
  const LangSelection({super.key});

  @override
  State<LangSelection> createState() => _LangSelectionState();
}

class _LangSelectionState extends State<LangSelection> {
        String selectedCountry = 'Eng';
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    return  Row(
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
                color: Colors.black,
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
          child: Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }
}



class RightLangBox extends StatefulWidget {
  const RightLangBox({super.key});

  @override
  State<RightLangBox> createState() => _RightLangBoxState();
}

class _RightLangBoxState extends State<RightLangBox> {
  String selectedCountry = 'Eng';
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none, // Allow overflow of the CircleAvatar
      children: [
        Container(
          width: screenWidth * 0.37,
          height: screenHeight * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
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
                child: Icon(Icons.arrow_drop_down),
              ),
              (screenWidth * 0.047).asWidthBox,
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -8,  // Move the mic icon slightly outside the container
          top: -8,
          bottom: -8,
          child: InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Mic is not working properly'),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                  )
              );
            },
            child: CircleAvatar(
              radius: 25,  // Increase size of the CircleAvatar
              backgroundColor: Colors.blue.shade400, // Adjust size as needed
              child: Image.asset(
                AppIcons.micIcon,
                scale: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}






class LeftLangBox extends StatefulWidget {
  const LeftLangBox({super.key});

  @override
  State<LeftLangBox> createState() => _LeftLangBoxState();
}

class _LeftLangBoxState extends State<LeftLangBox> {
  String selectedCountry = 'Eng';
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none, // Allow overflow of the CircleAvatar
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenHeight * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
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
                      color: Colors.black,
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
                child: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
        Positioned(
          right: -8,  // Move the mic icon slightly outside the container
          top: -8,
          bottom: -8,
          child: InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Mic is not working properly'),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                  )
              );
            },
            child: CircleAvatar(
              radius: 25,  // Increase size of the CircleAvatar
              backgroundColor: Colors.blue.shade400, // Adjust size as needed
              child: Image.asset(
                AppIcons.micIcon,
                scale: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
