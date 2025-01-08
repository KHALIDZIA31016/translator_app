import 'package:flutter/material.dart';

class PhrasesCategoryScreen extends StatefulWidget {
  final String name;
  final int id;
  const PhrasesCategoryScreen({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  State<PhrasesCategoryScreen> createState() => _PhrasesCategoryScreenState();
}

class _PhrasesCategoryScreenState extends State<PhrasesCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
