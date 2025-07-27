
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:narramap/bussiness/domain/enum/week_days_enum.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/presentation/notifiers/bussiness_notifier.dart';
import 'package:narramap/bussiness/presentation/widgets/bussines_no_editable_content.dart';
import 'package:narramap/bussiness/presentation/widgets/bussiness_editable_info.dart';
import 'package:narramap/bussiness/presentation/widgets/rating_card.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';
import 'package:narramap/shared/presentation/widgets/comments_container.dart';
import 'package:narramap/shared/presentation/widgets/custom_checklist.dart';
import 'package:narramap/shared/presentation/widgets/custom_multiple_selector.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/images_container.dart';
import 'package:provider/provider.dart';

class BussinessCard extends StatelessWidget {

  Bussiness? bussiness;
  String bussinessId;
  BussinessCard({
    super.key,
    this.bussiness,
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
              builder: (context, notifier, _) => StackableScaffold(
                child: notifier.bussiness != null ? 
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 20,
                        children: [
                          BussinessEditableInfo(
                            setBussiness: notifier.setBusssiness,
                            bussiness: notifier.bussiness!,
                            editable: bussiness != null, 
                            ownerProfile: notifier.ownerProfile!
                          ),

                          BussinesNoEditableContent(
                            averageRate: notifier.averageRate, 
                            bussinessId: bussinessId, 
                            ratings: notifier.ratings
                          )
                      
                        ],
                      )
                    ]
                  )
                : 
                  Text(
                    "No se pudo obtener el negocio",
                    style: TextStyle(
                      color: TextColor.gray.textColor
                    ),
                  ) 
              ),
            ),

        );
      },
      
    );
  }
}