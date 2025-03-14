import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:islamic_will/views/widgets/textformfield.widget.dart';
import 'package:flutter/material.dart';

class AppUnderlineTextFormField extends AppTextFormField {
  const AppUnderlineTextFormField({
    super.key,
    super.textEditingController,
    super.label,
    super.initialValue,
    super.enabled,
    super.hintText = "",
    super.obscureText = false,
    super.prefixIcon,
    super.suffixIcon,
    super.textInputType = TextInputType.text,
    super.validator,
    super.onChanged,
  });

  @override
  State<AppUnderlineTextFormField> createState() => _AppUnderlineTextFormFieldState();
}

class _AppUnderlineTextFormFieldState extends State<AppUnderlineTextFormField> {
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
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          borderSide: BorderSide.none,
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          borderSide: BorderSide.none,
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
          borderSide: BorderSide.none,
        ),
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
