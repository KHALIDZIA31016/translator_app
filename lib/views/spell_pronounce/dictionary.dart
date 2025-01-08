import 'package:flutter/material.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';

import '../../utils/app_icons.dart';
import '../../widgets/text_widget.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: regularText(
          title: 'Dictionary',
          textColor: Colors.blueGrey,
          textSize: 16,
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            children: [
              10.asHeightBox,
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.indigo,),
                    suffixIcon: IconButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,

                              content: Center(
                                  child: Text('Mic is not working')
                              ),
                          ));
                    },icon: Icon(Icons.mic), color: Colors.indigo,),
                    hintText: 'search here',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                    )
                  ),
                ),
              ),
              100.asHeightBox,
              Icon(Icons.book_online_outlined, color: Colors.indigo.shade100, size: 200,)
            ],
          ),
        ),
      ),
    );
  }
}
