
enum Routes {
  home(label: "/"),
  login(label: "/login"),
  register(label: "/register"),
  addEco(label: "/new-eco"),
  addEvent(label: "/new-event"),
  redirectionBussiness(label: "/redirect-bussiness"),
  addBussiness(label: "/new-bussines"),
  bussiness(label: "/bussiness"),
  publicProfile(label: "/public-profile"),
  aumentedReality(label: "/aumented_reality"),
  someonePublicProfile(label: "/public-profile/:id"),
  predictionService(label: "/prediction-service/:id")
  ;

  final String label;

  const Routes({required this.label});

  String getParametredRoute (List<String> params) {

    var finalRoute = "";
    var currentRoute = label;
    for (String param in params) {
      final indexOfDoublePoints = currentRoute.indexOf(":");

      if(indexOfDoublePoints == -1) throw Exception("esta ruta no tiene parametros o no tiene el mismo numero de parametros que los proporcionados");
      final firstOfRoute = currentRoute.substring(0, indexOfDoublePoints);
      var restOfRoute = currentRoute.substring(indexOfDoublePoints);

      final indexOfSlash = restOfRoute.indexOf('/');

      if(indexOfSlash == -1) {
        finalRoute = "$finalRoute$firstOfRoute$param";
        currentRoute = "";
      } else {
        restOfRoute = restOfRoute.substring(indexOfSlash);
        finalRoute = "$finalRoute$firstOfRoute$param";
        currentRoute = restOfRoute;
      }
    }

    return finalRoute;
  }
}