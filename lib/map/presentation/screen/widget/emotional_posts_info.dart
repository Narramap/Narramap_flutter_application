
import 'package:flutter/material.dart';
import 'package:narramap/shared/data/enum/emotion_enum.dart';
import 'package:narramap/map/domain/model/layers_enum.dart';
import 'package:narramap/shared/presentation/widgets/custom_checklist.dart';
import 'package:narramap/shared/presentation/widgets/custom_dropdown.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';

class EmotionalPostsInfo extends StatefulWidget {

  final void Function(LayersEnum) onChange;
  const EmotionalPostsInfo({
    super.key,
    required this.onChange
  });

  @override
  State<EmotionalPostsInfo> createState() => _EmotionalPostsInfoState();
}

class _EmotionalPostsInfoState extends State<EmotionalPostsInfo> {

  bool _showInfo = false;
  bool _showLayersOptions = false;

  void toggleShowInfo() {
    setState(() {
      _showInfo = !_showInfo;
    });
  }

  void toggleShowLayers() {
    setState(() {
      _showLayersOptions = !_showLayersOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 160, left: 20, right: 20),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            !_showInfo ? 
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 218, 218, 218), // Fondo blanco
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(Icons.info),
                color: TextColor.gray.textColor, // Color del ícono
                onPressed: toggleShowInfo,
              ),
            )
            :
            Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    IconButton(
                      onPressed: toggleShowInfo, 
                      icon: Icon(
                        Icons.close, 
                        color: TextColor.gray.textColor,
                        size: 20,
                      ),
                    ),
                    
                    ...Emotions.values.map(
                    (emotion) => Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: emotion.color,
                          size: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          emotion.label, 
                          style: TextStyle(
                            color: TextColor.gray.textColor
                          ),)
                      ],
                    )
                  ),
                  
                  ],
                ),
              ), 
            ),

        
            !_showLayersOptions ? 
        
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(Icons.layers),
                color: TextColor.gray.textColor, // Color del ícono
                onPressed: toggleShowLayers,
              ),
            )
            :
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: toggleShowLayers, 
                      icon: Icon(
                        Icons.close,
                        color: TextColor.gray.textColor,
                      )
                    ),
                    SizedBox(width: 2),
                    CustomDropdown<LayersEnum>(
                      onChanged: widget.onChange,
                      options: LayersEnum.values
                    ),
                  ],
                ),
              ),
            )
            
        
          ],
        ),
      ),
    );
  }
}