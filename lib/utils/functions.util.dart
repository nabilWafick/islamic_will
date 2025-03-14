/*
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/utils/prefs.util.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
//import 'package:get/get_connect/http/src/http/io/http_request_io.dart';

class AuthFunctions {
  static Future<void> register({
    required GlobalKey<FormState> formKey,
    required Registration registration,
    required VoidCallback toggleLoading,
  }) async {
    if (formKey.currentState?.validate() ?? true) {
      toggleLoading();
      final isRegistered = (await AuthService().register(registration: registration)) ?? false;
      toggleLoading();
      if (isRegistered) {
        Get.to(() => LoginPage());
      }
    }
  }

  static Future<void> login({
    required GlobalKey<FormState> formKey,
    required Login login,
    required VoidCallback toggleLoading,
  }) async {
    if (formKey.currentState?.validate() ?? true) {
      toggleLoading();

      final isLogin = (await AuthService().login(login: login)) ?? false;

      if (isLogin) {
        // check enrollment status
        await AuthService().getUserEnrollment();

        if (getUserEnrollmentStatus == 'validated') {
          // if enrollment is completed
          // navigate to main page
          Get.offAll(() => MainPage());
        } else {
          // naviagate to profil completion page
          Get.to(() => ProfilCompletionPage());
        }
      }

      toggleLoading();
    }
  }

  static Future<void> completeEnrollment({
    required GlobalKey<FormState> formKey,
    required EnrollmentCompletion enrollmentCompletion,
    required VoidCallback toggleLoading,
  }) async {
    if (enrollmentCompletion.crops.isEmpty) {
      Helpers.showToast(
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
        title: "Invalide",
        description: "Veuillez choisir au moins une culture",
      );
    } else if (formKey.currentState?.validate() ?? true) {
      toggleLoading();
      final message = (await AuthService().completeEnrollment(
        enrollmentCompletion: enrollmentCompletion,
      ));
      toggleLoading();
      if (message != null) {
        Helpers.showToast(
          style: ToastificationStyle.minimal,
          type: ToastificationType.success,
          title: "Succes",
          description: message,
        );
        Get.to(
          () => LoginPage(),
        );
      } else {
        Helpers.showToast(
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
          title: "Error",
          description: "Une erreur s'est produite. Veuillez réessayer",
        );
      }
    }
  }

  static Future<void> resetPassword() async {}
}

class PreAgreementsFunctions {
  static Future<void> addNew({
    required GlobalKey<FormState> formKey,
    required NewPreAgreement newAgreement,
    required VoidCallback toggleLoading,
  }) async {
    if (newAgreement.terms.isEmpty) {
      Helpers.showToast(
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
        title: "Invalide",
        description: "Veuillez ajouter au moins un terme",
      );
    } else if (formKey.currentState?.validate() ?? true) {
      toggleLoading();
      final message = (await PreAgreementService().add(
        newPreAgreement: newAgreement,
      ));
      toggleLoading();
      if (message != null) {
        Helpers.showToast(
          style: ToastificationStyle.minimal,
          type: ToastificationType.success,
          title: "Succes",
          description: message,
        );
        Get.to(
          () => LoginPage(),
        );
      } else {
        Helpers.showToast(
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
          title: "Error",
          description: "Une erreur s'est produite. Veuillez réessayer",
        );
      }
    }
  }
}

*/
