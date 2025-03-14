import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class AppDropdown<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String Function(T)? itemToString;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  final double? width;
  final bool enable;

  const AppDropdown({
    super.key,
    required this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.itemToString,
    this.decoration,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.width = 150.0,
    this.enable = true,
  });

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField<T>(
        enableFeedback: widget.enable,
        value: selectedValue,
        decoration: widget.decoration ??
            InputDecoration(
              border: InputBorder.none,
              isDense: true,
              label: AppText(widget.label),
              //  contentPadding: EdgeInsets.zero,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
            ),
        items: widget.items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: AppText(
              widget.itemToString != null ? widget.itemToString!(item) : item.toString(),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
          );
        }).toList(),
        onChanged: widget.enable
            ? (T? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              }
            : null,
      ),
    );
  }
}
