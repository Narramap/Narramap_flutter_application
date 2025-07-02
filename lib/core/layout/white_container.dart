import 'package:flutter/material.dart';
import 'package:narramap/core/layout/global_app_bar.dart';

class WhiteContainer extends StatelessWidget  {

  final List<Widget> children;
  final String? title;
  final bool lazyload;
  const WhiteContainer({
    super.key,
    required this.children,
    this.title,
    this.lazyload = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: GlobalAppBar(nTokens: 10),
      body: lazyload ? ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          if(title != null)
            Text(
              title!,
              style: TextStyle(
                color: Color(0xFF474747),
                fontSize: 25
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 40),
          ...children,
          SizedBox(height: 100),
        ],
      )
      :
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            if(title != null)
              Text(
                title!,
                style: TextStyle(
                  color: Color(0xFF474747),
                  fontSize: 25
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 40),
            ...children,
            SizedBox(height: 100),
          ],
        )
      )
    );
  }
}