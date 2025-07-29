
import 'package:flutter/material.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/presentation/notifiers/bussiness_notifier.dart';
import 'package:narramap/bussiness/presentation/widgets/bussines_no_editable_content.dart';
import 'package:narramap/bussiness/presentation/widgets/bussiness_editable_info.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class BussinessCard extends StatelessWidget {

  Bussiness? bussiness;
  String bussinessId;
  final bool editable;
  BussinessCard({
    super.key,
    this.bussiness,
    this.editable = true,
    required this.bussinessId
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BussinessNotifier(),
      builder: (context, child) {
        final notifier = Provider.of<BussinessNotifier>(context, listen: false);

        return FutureBuilder(
          future: notifier.getAll(bussiness, bussiness?.id ?? bussinessId), 
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
            Center(child: CircularProgressIndicator())
          : 
            Consumer<BussinessNotifier>(
              builder: (context, notifier, _) => notifier.bussiness != null ? 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      BussinessEditableInfo(
                        setBussiness: notifier.setBusssiness,
                        bussiness: notifier.bussiness!,
                        editable: editable, 
                        ownerProfile: notifier.ownerProfile!
                      ),
                  
                      BussinesNoEditableContent(
                        showAddRating: notifier.showAddRating,
                        toggleShowAddRating: notifier.toggleAddRating,
                        rating: notifier.newRating,
                        averageRate: notifier.averageRate, 
                        bussinessId: bussinessId, 
                        ratings: notifier.ratings,
                        changeRating: notifier.changeRating,
                        saveRating: notifier.saveRating,
                      )
                  
                    ],
                  )
                : 
                  Text(
                    "No se pudo obtener el negocio",
                    style: TextStyle(
                      color: TextColor.gray.textColor
                    ),
                  ) 
              ),
            );
      },
      
    );
  }
}