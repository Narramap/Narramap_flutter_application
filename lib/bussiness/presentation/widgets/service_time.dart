
import 'package:flutter/widgets.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class ServiceTime extends StatelessWidget {

  final String openTime;
  final String closeTime;
  const ServiceTime({
    super.key,
    required this.openTime,
    required this.closeTime
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "Horario de servicio",
          style: TextStyle(
            fontSize: 17,
            color: TextColor.gray.textColor
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text(
              openTime,
              style: TextStyle(
                color: TextColor.gray.textColor,
                fontSize: 50
              ),
            ),
            
            Text(
              "-",
              style: TextStyle(
                color: TextColor.gray.textColor,
                fontSize: 20
              ),
            ),
        
            Text(
              closeTime,
              style: TextStyle(
                color: TextColor.gray.textColor,
                fontSize: 50
              ),
            ),
            SizedBox(),
        
          ],
        ),
      ],
    );
  }
}