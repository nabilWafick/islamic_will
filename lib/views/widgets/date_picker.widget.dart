import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/views/widgets/elevated_icon_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppDateTimePicker extends StatefulWidget {
  final String label;
  final ValueChanged<DateTime?> onDateSelect;
  final double? width;
  final bool? isNullable;
  final bool enable;
  const AppDateTimePicker({
    super.key,
    required this.label,
    required this.onDateSelect,
    this.width,
    this.isNullable = true,
    this.enable = true,
  });

  @override
  State<AppDateTimePicker> createState() => _AppDateTimePickerState();
}

class _AppDateTimePickerState extends State<AppDateTimePicker> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', '');
  }

  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('EEE dd MMM yyyy', 'fr_FR');

    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppElevatedIconButton(
            icon: Icons.calendar_month_rounded,
            text: widget.label,
            onTap: widget.enable
                ? () async {
                    final datePicked = await Helpers.showDateTime(
                      context: context,
                      isNullable: widget.isNullable ?? true,
                    );
                    setState(() {
                      _selectedDate = datePicked;
                    });

                    widget.onDateSelect(_selectedDate);
                  }
                : () {},
          ),
          AppText(
            _selectedDate != null ? dateFormatter.format(_selectedDate!) : "",
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
