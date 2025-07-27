
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:narramap/bussiness/data/interceptors/rating_interceptor.dart';
import 'package:narramap/bussiness/presentation/notifiers/rating_card_notifier.dart';
import 'package:narramap/bussiness/presentation/notifiers/redirection_notifier.dart';
import 'package:narramap/shared/presentation/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class RatingCard extends StatelessWidget {

  final RatingInterceptor rating;
  RatingCard({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RatingCardNotifier>(
      create: (_) => RatingCardNotifier(),
      builder: (context, child)  {
        final notifier = Provider.of<RatingCardNotifier>(context, listen: false);

        return FutureBuilder(
          future: notifier.getUserProfile(rating.userId), 
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator()
                ],
              )
            :
              Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: notifier.userProfile!.profilePhoto != null ? 
                          NetworkImage(notifier.userProfile!.profilePhoto!) 
                        : 
                          AssetImage("assets/images/default_profile_photo.webp")
                      ),
                      Text(
                        notifier.userProfile!.nickname,
                        style: TextStyle(
                          color: TextColor.gray.textColor,
                        ),
                      )
                    ],
                  ),
                  RatingBarIndicator(
                    rating: rating.rating.toDouble(),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ), 
                    itemCount: 5,
                    itemSize: 20,
                    direction: Axis.horizontal,
                  ),
                ],
              )
        );
      },
    );
  }
}