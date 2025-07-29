
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:narramap/core/layout/gradient_container.dart';
import 'package:narramap/core/navigation/routes.dart';
import 'package:narramap/shared/data/enum/sex_enum.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_button.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_checklist.dart';
import 'package:narramap/shared/presentation/widgets/buttons/custom_radio_button.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_switch.dart';
import 'package:narramap/shared/presentation/widgets/inputs/custom_text_field.dart';
import 'package:narramap/shared/presentation/widgets/inputs/password_text_field.dart';
import 'package:narramap/shared/presentation/widgets/inputs/quantity_selector.dart';
import 'package:narramap/auth/presentation/notifiers/register_notifier.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => RegisterNotifier(),
      child: GradientContainer(
        children: [
          Consumer<RegisterNotifier>(
            builder: (context, notifier, _) => Column(
              children: [
                CustomTextField(
                  onChanged: notifier.onChangeNickname,
                  label: "Nombre de usuario",
                  spacerHeight: 30,
                ),
                QuantitySelector(
                  onDecrement: notifier.onDecrement, 
                  onIncrement: notifier.onIncrement, 
                  label: "Edad", 
                  value: notifier.age
                ),
                SizedBox(height: 30),
                CustomRadioButton<SexEnum>(
                  label: "Sexo",
                  selectedValue: notifier.sex,
                  group: SexEnum.other,
                  options: SexEnum.values.map((sex) => Option<SexEnum>(
                    label: sex.label, 
                    value: sex
                  )).toList(), 
                  onChanged: notifier.onChangeSex
                ),
                SizedBox(height: 30),
                CustomSwitch(
                  label: "Cuenta publica", 
                  value: notifier.public, 
                  onChanged: notifier.onChangePublic
                ),
                SizedBox(height: 30),
                CustomTextField(
                  onChanged: notifier.onChangeEmail, 
                  label: "Correo electronico",
                  spacerHeight: 30,
                ),
                PasswordTextField(
                  onChanged: notifier.onChangePassword, 
                  changeShowPassword: notifier.onChangeShowPassword, 
                  showPassword: notifier.showPassword,
                  spacerHeight: 30,
                ),

                CustomSwitch(
                  label: "Cuenta de negocios", 
                  value: notifier.bussinessProfile, 
                  onChanged: notifier.onChangeBussinessProfile
                ),
                SizedBox(height: 10),
                if(notifier.error)
                  Text(
                    notifier.errorMessage,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 220, 220, 220)
                    ),
                  ),
                SizedBox(height: 40),
                CustomButton(
                  text: "Registrarse",
                  maxSize: true,
                  onPressed: () => notifier.onRegister(() => context.push(Routes.login.label))
                )
              ],
            )
          )
        ]
      ),
    );    
  }
}