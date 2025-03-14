import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class AuthDropdown<T> extends StatefulWidget {
  final String label;
  final String? info;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String Function(T)? itemToString;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;

  const AuthDropdown({
    super.key,
    required this.label,
    this.info,
    required this.items,
    this.value,
    this.onChanged,
    this.itemToString,
    this.decoration,
    this.hintText,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<AuthDropdown<T>> createState() => _AuthDropdownState<T>();
}

class _AuthDropdownState<T> extends State<AuthDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

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
                widget.label,
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
          DropdownButtonFormField<T>(
            value: selectedValue,
            decoration: widget.decoration ??
                InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  //  contentPadding: EdgeInsets.zero,
                  hintText: widget.hintText,
                  prefixIcon: widget.prefixIcon,
                ),
            items: widget.items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: AppText(
                  widget.itemToString != null ? widget.itemToString!(item) : item.toString(),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryText,
                ),
              );
            }).toList(),
            onChanged: (T? newValue) {
              setState(() {
                selectedValue = newValue;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(newValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
