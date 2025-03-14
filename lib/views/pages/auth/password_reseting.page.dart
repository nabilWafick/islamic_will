import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/auth_textformfield.widget.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordResetingPage extends StatelessWidget {
  const PasswordResetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppSvgs.logo),
              Column(
                spacing: 20.0,
                children: [
                  AuthTextFormField(
                    label: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  AppElevatedButton(text: "Réinitialiser", onPressed: () {}),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
