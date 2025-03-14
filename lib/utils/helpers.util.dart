// ignore_for_file: use_build_context_synchronously

import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Helpers {
  static ToastificationItem showToast({
    required ToastificationStyle style,
    required ToastificationType type,
    required String title,
    required String description,
  }) {
    return toastification.show(
      style: style,
      type: type,
      title: AppText(title),
      description: AppText(description),
      showProgressBar: true,
      animationDuration: const Duration(milliseconds: 300),
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: AppValues.midCircularBorder,
      //  BorderRadius.circular(.0),
      //  primaryColor: AppColors.primary,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.onHover,
        buttonBuilder: (context, onClose) {
          return OutlinedButton.icon(
            onPressed: onClose,
            icon: const Icon(
              Icons.close,
              size: 20,
              color: AppColors.primary,
            ),
            label: const AppText(
              'Close',
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
      closeOnClick: true,
    );
  }

  static String extractLastChars({required String input, int lenght = 4}) {
    if (input.length < lenght) {
      return input;
    }
    return input.substring(input.length - lenght);
  }

  static Future<DateTime?> showDateTime({
    required BuildContext context,
    required bool isNullable,
  }) async {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      locale: const Locale('fr', 'FR'),
      firstDate: DateTime(2010),
      lastDate: DateTime(20500),
      confirmText: 'Valider',
      cancelText: 'Annuler',
    );

    selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: 'Valider',
      cancelText: 'Annuler',
    );

    DateTime? dateTime;

    if (selectedDate != null) {
      dateTime = DateTime.now();
      dateTime = dateTime.copyWith(
        year: selectedDate.year,
        month: selectedDate.month,
        day: selectedDate.day,
        hour: selectedTime != null ? selectedTime.hour : 0,
        minute: selectedTime != null ? selectedTime.minute : 0,
        second: 0,
      );
    }

    return isNullable ? dateTime : (dateTime ?? DateTime.now());
  }

  static Future<dynamic> navigate({required BuildContext context, required Widget page}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
