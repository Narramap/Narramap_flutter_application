

import 'package:flutter/cupertino.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/presentation/widgets/bussiness_card.dart';
import 'package:narramap/shared/utils/custom_modal.dart';

void showBussinessModal(BuildContext context, Bussiness bussiness) {
  showCustomModal(
    context, 
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BussinessCard(
        bussiness: bussiness,
        bussinessId: bussiness.id,
        editable: false,
      ),
    )
  );
} 