
import 'package:flutter/material.dart';
import 'package:narramap/bussiness/presentation/notifiers/redirection_notifier.dart';
import 'package:narramap/bussiness/presentation/screens/add_bussiness.dart';
import 'package:narramap/bussiness/presentation/screens/bussiness_screen.dart';
import 'package:provider/provider.dart';

class RedirectionBussiness extends StatelessWidget {
  const RedirectionBussiness({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RedirectionNotifier>(
      create: (_) => RedirectionNotifier(),
      builder: (context, _) {
        final notifier = Provider.of<RedirectionNotifier>(context, listen: false);

        return FutureBuilder(
          future: notifier.getBussinessByUserId(), 
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
            Center(
              child: CircularProgressIndicator()
            )
          :
            Consumer<RedirectionNotifier>(
              builder: (context, notifier, _) => notifier.bussiness != null ?
              BussinessScreen(bussiness: notifier.bussiness!)
            : 
              AddBussiness()
            )
            
        );

      }
      
    );
  }
}