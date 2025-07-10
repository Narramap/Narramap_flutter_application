
import 'package:flutter/material.dart';
import 'package:narramap/shared/widgets/custom_button.dart';
import 'package:narramap/shared/widgets/custom_switch.dart';
import 'package:narramap/users/domain/model/user.dart';

class ConexionsContainer extends StatelessWidget {

  final List<User> conexions;
  const ConexionsContainer({
    super.key,
    required this.conexions
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "Conexiones",
          style: TextStyle(
            color: TextColor.gray.textColor,
            fontSize: 20
          ),
        ),
        SizedBox(height: 20),
        ...conexions.map((conexion) => Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ButtonColors.gray.backgroundColor,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  conexion.imageUrl,
                ),
                radius: 20,
              ),
              
              Text(
                conexion.nickname,
                style: TextStyle(
                  color: Color(0xFF848484)
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}