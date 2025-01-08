import 'package:flutter/material.dart';
import 'package:mnh/views/languages/languages.dart';
import 'package:mnh/views/spell_pronounce/spell_pronounce.dart';
import 'package:mnh/widgets/custom_textBtn.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';

import '../../../widgets/text_widget.dart';


class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

 @override
  void initState() {
    super.initState();
    _controller.addListener((){
      setState(() {
        _isButtonEnabled = _controller.text.length >=20;
      });
    });
  }

@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: regularText(title: 'Customer Support', textSize: 18, textColor: Colors.grey.shade600, textWeight: FontWeight.w400),
      leading: BackButton(),
      ),

      body: Column(
        children: [
         Center(
           child: Container(
             height: 200, width: 400,
             color: Colors.white,
             child: TextFormField(
               controller: _controller,
               maxLines: null,
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12),
                   borderSide: BorderSide.none
                 ),
                 hintText: 'Describe Issue (atleast 20 characters)',
                 hintStyle: TextStyle(
                   fontSize: 16,
                   color: Colors.grey,
                   fontWeight: FontWeight.w300,
                 )
               ),
             ),
           ),

         ),
          Spacer(),

         InkWell(
           onTap: _isButtonEnabled ? (){
             Navigator.pop(context);
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Center(child: regularText(title: 'Query Sent Successfully', textSize: 16, textColor: Colors.white)))
             );
           } :null ,
           child: CustomTextBtn(
                height: 50,
                width: 300,
                textTitle: 'send query',
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _isButtonEnabled ? Colors.indigo :Colors.grey,
              ),
            ),
         ),
        ],
      ),
    );
  }
}
