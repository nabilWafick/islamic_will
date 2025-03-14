import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final String? hintText;
  final String? initialValue;
  final bool? enabled;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const AppTextFormField({
    this.textEditingController,
    super.key,
    this.label,
    this.initialValue,
    this.enabled,
    this.hintText = "",
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onChanged,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      enabled: widget.enabled,
      initialValue: widget.initialValue,
      keyboardType: widget.textInputType,
      obscureText: showPassword ? false : widget.obscureText,
      cursorColor: AppColors.primary,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        label: widget.label != null
            ? AppText(
                widget.label!,
                // fontSize: 15.0,
              )
            : null,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  showPassword = !showPassword;
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : widget.suffixIcon,
      ),
      validator: widget.validator != null
          ? (value) {
              return widget.validator!(value);
            }
          : null,
      onChanged: widget.onChanged != null
          ? (newValue) {
              widget.onChanged!(newValue);
            }
          : null,
      onSaved: widget.onChanged != null
          ? (newValue) {
              widget.onChanged!(newValue);
            }
          : null,
      enableSuggestions: true,
    );
  }
}
