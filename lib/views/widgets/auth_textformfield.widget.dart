import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:islamic_will/views/widgets/textformfield.widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ep.dart';

class AuthTextFormField extends AppTextFormField {
  final String? info;
  final bool? isPhone;
  final ValueChanged<String>? onPrefixChanged;
  AuthTextFormField({
    super.key,
    super.textEditingController,
    required super.label,
    super.initialValue,
    super.enabled,
    super.hintText = "",
    super.obscureText = false,
    super.prefixIcon,
    super.suffixIcon,
    super.textInputType,
    super.validator,
    super.onChanged,
    this.info,
    this.isPhone,
    this.onPrefixChanged,
  }) {
    assert(label != null, "Label must not be null");
    assert(
        (isPhone != null && onPrefixChanged != null) ||
            (isPhone == null && onPrefixChanged == null),
        "isPhone and on PrefixChanged must be provided");
  }

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  @override
  void initState() {
    super.initState();

    setState(() {
      _showPassword = widget.obscureText == false;
    });
  }

  bool _showPassword = true;
  String _prefix = "229";

  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(AppValues.padding * .5),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppValues.cardRadius),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                widget.label!,
                fontSize: 12,
                color: AppColors.cardIconBackground,
                fontWeight: FontWeight.w700,
              ),
              widget.info != null
                  ? Tooltip(
                      message: widget.info,
                      triggerMode: TooltipTriggerMode.tap,
                      showDuration: const Duration(seconds: 5),
                      child: const Icon(
                        Icons.info_outline,
                        color: AppColors.primary,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(height: 8),
          Row(
            spacing: 5.0,
            children: [
              widget.isPhone == true
                  ? GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            debugPrint('Select country: ${country.countryCode}');

                            setState(() {
                              _prefix = country.phoneCode;
                            });

                            if (widget.onPrefixChanged != null) {
                              widget.onPrefixChanged!(country.phoneCode);
                            }
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                        ),
                        child: AppText(
                          "+$_prefix",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          // AppColors.indigo,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: TextFormField(
                  controller: widget.textEditingController,
                  keyboardType: widget.textInputType,
                  textAlign: TextAlign.left,
                  obscureText: _showPassword == false,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    //  contentPadding: EdgeInsets.zero,
                    //  enabledBorder: InputBorder.none,
                    // focusedBorder: InputBorder.none,

                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.obscureText
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: /* Icon(
                              _showPassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            */
                                Iconify(
                              !_showPassword ? Ep.view : Ep.i_hide,
                              color: AppColors.cardIconBackground,
                            ),
                          )
                        : widget.suffixIcon,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onSaved: widget.onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
