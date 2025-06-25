import 'package:flutter/material.dart';
import 'package:narramap/core/layout/global_app_bar.dart';

class WhiteContainer extends StatelessWidget  {

  final List<Widget> children;
  final String? title;
  const WhiteContainer({
    super.key,
    required this.children,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: GlobalAppBar(nTokens: 10),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            if(title != null) 
              Text(title!),
            ...children
          ],
        ),
      ),
    );
  }
}