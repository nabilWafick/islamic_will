import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/utils/validators.util.dart';
import 'package:islamic_will/views/pages/auth/password_reseting.page.dart';
import 'package:islamic_will/views/pages/auth/register.page.dart';
import 'package:islamic_will/views/widgets/auth_textformfield.widget.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  bool _loading = false;

  void _toggleLoadingState() => setState(() {
        _loading = !_loading;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppValues.padding),
            height: MediaQuery.sizeOf(context).height * .95,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //    SvgPicture.asset(AppSvgs.logo),
                  const SizedBox(),
                  Column(
                    children: [
                      AuthTextFormField(
                        label: "Email",
                        info: "L'email doit être valide.",
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _emailController,
                        validator: AuthValidators.email,
                      ),
                      const SizedBox(height: 20.0),
                      AuthTextFormField(
                        label: "Mot de passe",
                        info:
                            "Le mot de passe doit contenir au moins 8 caractères dont une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial.",
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        textEditingController: _passwordController,
                        validator: AuthValidators.password,
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => Helpers.navigate(
                          context: context,
                          page: const PasswordResetingPage(),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          alignment: Alignment.centerRight,
                          child: const AppText(
                            "Mot de passe oublié",
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 20.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _loading
                          ? const CupertinoActivityIndicator(
                              //  color: AppColors.primary,
                              radius: 10.0,
                            )
                          : AppElevatedButton(
                              text: "Connexion",
                              onPressed: () async {
                                _toggleLoadingState();

                                Future.delayed(const Duration(seconds: 3));

                                _toggleLoadingState();
                              }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 5.0,
                        children: [
                          const AppText(
                            "Vous n'avez pas de compte ?",
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () => Helpers.navigate(
                              context: context,
                              page: const RegistrationPage(),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: const AppText(
                                "Inscrivez-vous",
                                color: AppColors.secondary,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
