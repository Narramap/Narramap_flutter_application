
import 'package:flutter/material.dart';



class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final int nTokens;
  const GlobalAppBar({
    super.key,
    required this.nTokens
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Color(0xFFF2F2F2),
      shadowColor: Colors.transparent,
      backgroundColor: Color(0xFFF2F2F2),
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 80,
      title: Image.asset(
        "assets/images/logo_narramap.png",
        width: 70,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}