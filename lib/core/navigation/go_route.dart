
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/aumented_reality.dart/presentation/screens/aumented_reality_screen.dart';
import 'package:narramap/bussiness/presentation/screens/add_bussiness.dart';
import 'package:narramap/bussiness/presentation/screens/redirection_bussiness.dart';
import 'package:narramap/content/presentation/screens/add_eco_screen.dart';
import 'package:narramap/content/presentation/screens/add_event_screen.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/map/presentation/screen/map_screen.dart';
import 'package:narramap/auth/presentation/screens/login_screen.dart';
import 'package:narramap/auth/presentation/screens/register_screen.dart';
import 'package:narramap/users/presentation/screens/public_profile_screen.dart';

GoRouter goRouter = GoRouter(
  initialLocation: Routes.login.label,
  routes: [
    GoRoute(
      path: Routes.home.label,
      builder: (context, state) => MapScreen()
    ),
    GoRoute(
      path: Routes.login.label,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Routes.register.label,
      builder: (context, state) => RegisterScreen() 
    ),
    GoRoute(
      path: Routes.addEco.label,
      builder: (context, state) => AddEcoScreen(),
    ),
    GoRoute(
      path: Routes.addEvent.label,
      builder: (context, state) => AddEventScreen(),
    ),
    GoRoute(
      path: Routes.publicProfile.label,
      builder: (context, state) => PublicProfileScreen(),
    ),
    GoRoute(
      path: Routes.aumentedReality.label,
      builder: (context, state) => AumentedRealityPage(),
    ),
    GoRoute(
      path: Routes.addBussiness.label,
      builder: (context, state) => AddBussiness(),
    ),
    GoRoute(
      path: Routes.someonePublicProfile.label,
      builder: (context, state) {
        final userId = state.pathParameters["id"];
        return PublicProfileScreen(userId: userId);
      }
    ),
    GoRoute(
      path: Routes.redirectionBussiness.label,
      builder: (context, state) => RedirectionBussiness(),
    ),
    // GoRoute(
    //   path: Routes.bussiness.label,
    //   builder: 
    // )
  ]
);