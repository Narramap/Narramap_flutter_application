
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
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 1),
          Image.asset(
            "assets/images/logo_narramap.png",
            width: 70,
          ),
          CustomButton(
            text: "$nTokens Eco Coins", 
            onPressed: () => context.push(Routes.buyTokens.label),
            icon: Icons.add_circle,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}