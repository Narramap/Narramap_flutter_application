
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:narramap/bussiness/domain/model/bussiness.dart';
import 'package:narramap/bussiness/presentation/widgets/bussiness_card.dart';
import 'package:narramap/core/layout/stackable_scaffold.dart';


class BussinessScreen extends StatelessWidget {

  final Bussiness bussiness;
  const BussinessScreen({
    super.key,
    required this.bussiness
  });

  @override
  Widget build(BuildContext context) {
    return StackableScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
          child: BussinessCard(bussiness: bussiness, bussinessId: bussiness.id),
        )
      )
    );
  }
}