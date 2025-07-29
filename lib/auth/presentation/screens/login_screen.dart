import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/DI/get_it_config.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/core/network/dio_client.dart';
import 'package:narramap/core/storage/secure_storage.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:narramap/shared/presentation/widgets/inputs/password_text_field.dart';
import 'package:narramap/auth/presentation/notifiers/login_notifier.dart';
import 'package:narramap/users/domain/use_cases/get_user_profile_use_case.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<void> checkCredentials() async {
    SecureStorage.init();
    final userId = await SecureStorage.getUserId();
    final token = await SecureStorage.getToken();
    final getProfileUseCase = getIt<GetUserProfileUseCase>();

    if (userId != null && token != null) {
      DioClient.authToken = token;

      final userProfile = await getProfileUseCase.run(userId, token);
      if (userProfile != null) {
        await SecureStorage.saveUserProfile(userProfile);
        if (context.mounted) {
          context.go(Routes.home.label);
        }
      } else {
        if (context.mounted) {
          context.go(Routes.login.label); // opcional: redirige si falla perfil
        }
      }
    } else {
      if (context.mounted) {
        context.go(Routes.login.label); // sin token ni userId
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkCredentials();
    });
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(() => context.push(Routes.home.label)),
      child: GradientContainer(
        children: [
          Consumer<LoginNotifier>(
            builder: (context, notifier, _) {

              // notifier.getUserIdAndToken(() => context.push(Routes.home.label));
              return Column(
                children: [
                  CustomTextField(
                    disableAutoComplete: true,
                    onChanged: notifier.onUpdateEmail,
                    label: "Correo electronico",
                    spacerHeight: 40,
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PasswordTextField(
                        onChanged: notifier.onUpdatePassword, 
                        changeShowPassword: notifier.changeShowPassword, 
                        showPassword: notifier.showPassword,
                        spacerHeight: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          "Registrate aqui",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        onTap: () => context.push(Routes.register.label),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  if(notifier.error) 
                    Text(
                      notifier.errorMessage,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 241, 241, 241)
                      ),
                    ),
                  SizedBox(height: 60),
                  
                  CustomButton(
                    text: "Iniciar Sesion", 
                    onPressed: () => notifier.onLogin(() => context.push(Routes.home.label))
                  )
                ],
              );
            }
            
          )
          
        ]
      ),
    );
  }
}