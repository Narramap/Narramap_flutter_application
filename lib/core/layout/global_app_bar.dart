
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/widgets/custom_button.dart';

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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 1),
          Image.asset(
            "assets/images/logo_narramap.png",
            width: 70,
          ),
          CustomButton(
            text: "$nTokens EC", 
            onPressed: () => context.push(Routes.buyTokens.label),
            icon: Icons.add_circle,
            padding: 0,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}