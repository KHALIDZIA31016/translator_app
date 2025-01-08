import 'package:flutter/material.dart';
import 'package:mnh/widgets/text_widget.dart';


class RemoveAdsScreen extends StatefulWidget {
  const RemoveAdsScreen({super.key});

  @override
  State<RemoveAdsScreen> createState() => _RemoveAdsScreenState();
}

class _RemoveAdsScreenState extends State<RemoveAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: regularText(title: 'Remove Ads'),),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
