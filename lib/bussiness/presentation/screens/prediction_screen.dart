
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/presentation/notifiers/prediction_notifier.dart';
import 'package:narramap/core/layout/white_container.dart';
import 'package:narramap/shared/presentation/widgets/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/utils/custom_modal.dart';
import 'package:provider/provider.dart';

class PredictionScreen extends StatelessWidget {

  final String bussinessId;
  const PredictionScreen({
    super.key,
    required this.bussinessId
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PredictionNotifier(),
      builder: (context, child) => Consumer<PredictionNotifier>(
        builder: (context, notifier, _) { 

              if (notifier.getting != null) {
                
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showCustomModal(
                    context,
                    notifier.getting! ? CircularProgressIndicator() :
                    Column(
                      children: [
                        if(notifier.prediction != null) ...[
                          Text(notifier.prediction!.predictionDate.toString()),
                          Text("Clientes esperados: ${notifier.prediction!.forecast.predictedVisits}"),
                          Text(notifier.prediction!.forecast.benchmark.incrementMonthlyAverage),
                          Text(notifier.prediction!.forecast.benchmark.incrementVsLastWeek),

                          ...notifier.prediction!.keyDrivers.map((key) => Column(
                            children: [
                              Text(key.feature),
                              Text(key.impact),
                              Text(key.reason),
                            ],
                          ))

                        ] 
                        else 
                          Text("No se puedo obtener la prediccion")
                      ],
                    )
                  );
                });
              }

            return WhiteContainer(
              title: "Prediccion de demanda para el negocio",
              children: [
                Column(
                  spacing: 20,
                  children: [
                    Text(
                      """Esta funcionalidad te permite conocer, en base al perfil de los usuarios cercanos a tu negocio, el numero de posibles clientes y posibles incrementos o decrementos en la demanda de tu negocio""",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: TextColor.gray.textColor
                      ),
                    ),
                    
                    Text(
                      """Por el momento esta funcionalidad es gratuita, en proximas actualizaciones sera una funcion de pago por medio de la moneda digital de Narramap (Eco Tokens)""",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: TextColor.gray.textColor
                      ),
                    ),
            
                    CustomButton(
                      text: "Prediccion", 
                      onPressed: () => notifier.getBussinessPrediction(bussinessId)
                    )

                    
                  ],
                )
              ]
          );
        }
      ), 
    );
  }
}