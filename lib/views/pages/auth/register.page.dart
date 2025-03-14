import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/utils/validators.util.dart';
import 'package:islamic_will/views/pages/auth/login.page.dart';
import 'package:islamic_will/views/widgets/auth_textformfield.widget.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(),
      _firstnameController = TextEditingController(),
      _emailController = TextEditingController(),
      _companyNamController = TextEditingController(),
      _companyIFUController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordConfirmController = TextEditingController();

  bool _loading = false;

  void _toggleLoadingState() {
    setState(() {
      _loading = !_loading;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _firstnameController.dispose();
    _emailController.dispose();
    _companyNamController.dispose();
    _companyIFUController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppValues.padding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 50.0,
              children: [
                //   SvgPicture.asset(AppSvgs.logo),
                Column(
                  spacing: 20,
                  children: [
                    AuthTextFormField(
                      label: "Nom",
                      info: "Le nom doit contenir au moins trois lettres.",
                      textEditingController: _nameController,
                      validator: AuthValidators.name,
                    ),
                    AuthTextFormField(
                      label: "Prénoms",
                      info: "Le prénom doit contenir au moins trois lettres.",
                      textEditingController: _firstnameController,
                      validator: AuthValidators.firstname,
                    ),
                    AuthTextFormField(
                      label: "Email Personnel",
                      info: "L'email doit être valide.",
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                      validator: AuthValidators.email,
                    ),
                    AuthTextFormField(
                      label: "Mot de passe",
                      info:
                          "Le mot de passe doit contenir au moins 8 caractères dont une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial.",
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _passwordController,
                      validator: AuthValidators.password,
                    ),
                    AuthTextFormField(
                      label: "Confirmer",
                      info: "Le mot de passe doit être conforme au précédent",
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _passwordConfirmController,
                      validator: (value) {
                        return AuthValidators.confirmPassword(
                          value,
                          _passwordController.text,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 20.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _loading
                        ? const CupertinoActivityIndicator(
                            color: AppColors.primary,
                          )
                        : AppElevatedButton(
                            text: "Inscription",
                            onPressed: () async {
                              _toggleLoadingState();

                              Future.delayed(const Duration(seconds: 3));

                              _toggleLoadingState();

                              /*  await AuthFunctions.register(
                                formKey: _formKey,
                                registration: Registration(
                                  type: _clientType,
                                  name: _nameController.text,
                                  firstname: _firstnameController.text,
                                  companyName: _companyNamController.text,
                                  companyIFU: _companyIFUController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword: _passwordConfirmController.text,
                                ),
                                toggleLoading: _toggleLoadingState,
                              ); */
                            },
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5.0,
                      children: [
                        const AppText(
                          "Vous avez un compte ?",
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                        ),
                        GestureDetector(
                          onTap: () => Helpers.navigate(
                            context: context,
                            page: const LoginPage(),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            child: const AppText(
                              "Connectez-vous",
                              color: AppColors.secondary,
                              fontSize: 12.0,
                              //  fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
