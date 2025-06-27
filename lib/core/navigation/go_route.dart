
import 'package:go_router/go_router.dart';
import 'package:narramap/content/presentation/screens/add_eco_screen.dart';
import 'package:narramap/content/presentation/screens/add_event_screen.dart';
import 'package:narramap/content/presentation/screens/adition_selector_screen.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/map/presentation/map_screen.dart';
import 'package:narramap/users/presentation/login_screen.dart';
import 'package:narramap/users/presentation/register_screen.dart';

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
      path: Routes.aditionSelector.label,
      builder: (context, state) => AditionSelectorScreen(),
    ),
    GoRoute(
      path: Routes.addEco.label,
      builder: (context, state) => AddEcoScreen(),
    ),
    GoRoute(
      path: Routes.addEvent.label,
      builder: (context, state) => AddEventScreen(),
    )
  ]
);