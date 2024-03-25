import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/ui/tv_pickers/components/tv_date_picker.dart'
    as tv_date_time_picker;

class GeneralTabController {
  ///-------------------------- variables --------------------------------------
  late ValueNotifier<DateTime> _fromDateNotifier;
  late ValueNotifier<DateTime> _toDateNotifier;

  ///-------------------------- Constructor ------------------------------------
  GeneralTabController({
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    _fromDateNotifier = ValueNotifier(fromDate ?? DateTime.now());
    _toDateNotifier = ValueNotifier(toDate ?? DateTime.now());
  }

  ///-------------------------- Getters ----------------------------------------
  DateTime get fromDate => _fromDateNotifier.value;
  DateTime get toDate => _toDateNotifier.value;
  ValueNotifier<DateTime> get fromDateNotifier => _fromDateNotifier;
  ValueNotifier<DateTime> get toDateNotifier => _toDateNotifier;

  ///-------------------------- Formatters -------------------------------------
  String formatDate(DateTime dateTime) {
    return DateFormat.yMEd().format(dateTime);
  }

  ///-------------------------- select date range  -----------------------------
  Future<void> selectRangeDate({required BuildContext context}) async {
    final DateTimeRange? rangerPicker =
        await tv_date_time_picker.showDateRangePicker(
            context: context,
            initialDateRange: DateTimeRange(
                start: fromDateNotifier.value, end: toDateNotifier.value),
            firstDate: DateTime.now(),
            lastDate: DateTime(2099, 12, 31),
            initialEntryMode: DatePickerEntryMode.calendar,
            helpText: '');

    if (rangerPicker != null) {
      _fromDateNotifier.value = rangerPicker.start;
      _toDateNotifier.value = rangerPicker.end;
    }
  }
}
