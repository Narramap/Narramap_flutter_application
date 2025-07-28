
import 'package:local_auth/local_auth.dart';

class LocalAuth {

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> checkDeviceSecurity() async {

    final bool isDeviceSupported = await auth.isDeviceSupported();
    final bool canCheckBiometrics = await auth.canCheckBiometrics;

    return isDeviceSupported || canCheckBiometrics;
  }
}